#!/usr/bin/env perl

# Скрипт для конвертации существующей базы в
# формат, пригодный для работы с Git

use strict;
use warnings;
use encoding 'utf8';

use File::Find;
use File::Temp;
use File::Spec;
use List::Util qw(max);
use POSIX qw(strftime);
use Encode;

use Git;
use Archive::Zip;
use XML::Parser::Expat;

my ($cats_lib_dir, $cats_git_storage);
BEGIN {
    $cats_lib_dir = $ENV{CATS_DIR} || "./cgi-bin";
    $cats_git_storage = $ENV{CATS_GIT_STORAGE} || "/srv/cats-git";
}

use lib $cats_lib_dir;
use CATS::DB;
use CATS::Git qw(:all);

my $isql = "/opt/firebird/bin/isql";
my $args = "-u sysdba -p masterkey cats";

my %title2pid;
my %pid2history;

my ($title, $author);

sub hasfield {
    my ($table, $field) = @_;
    return scalar $dbh->selectrow_array(q~
    SELECT
        RDB$RELATION_FIELDS.RDB$FIELD_NAME
    FROM
        RDB$RELATION_FIELDS
    WHERE
        RDB$RELATION_FIELDS.RDB$RELATION_NAME = UPPER(?)
        AND RDB$RELATION_FIELDS.RDB$FIELD_NAME = UPPER(?);
~, undef, $table, $field);
}


sub addfield {
    my ($table, $field) = @_;
    unless (hasfield($table, $field)) {
        my $rows_affected = $dbh->do("ALTER TABLE $table ADD $field CHAR(40)"); # размер хеша SHA1 -- 40 символов
        die "failed to create column $field in table $table" unless defined $rows_affected;
        print "created column $field in table $table\n";
    }
    $dbh->commit or die $dbh->errstr;
}

sub delfield {
    my ($table, $field) = @_;
    if (hasfield($table, $field)) {
        my $rows_affected = $dbh->do("ALTER TABLE $table DROP $field");
        die "failed to delte column $field from table $table" unless defined $rows_affected;
        print "deleted column $field in table $table\n";
    }
    $dbh->commit or die $dbh->errstr;
}


sub addfields {
    for my $pair (@_) {
        addfield(reverse @$pair);
    }
}

sub delfields {
    for my $pair (@_) {
        delfield(reverse @$pair);
    }
}

sub makedir {
    my $dir = shift;
    mkdir $dir unless -d $dir;
}

sub convert_users_attempts {
    makedir("$cats_git_storage/contests");
    my ($ccount) = $dbh->selectrow_array("SELECT COUNT(*) FROM contests");
    my $ids_q = $dbh->prepare("SELECT id FROM contests");
    $ids_q->execute;
    my $i = 1;
    while(my ($cid) =  $ids_q->fetchrow_array) {
        print "[$i/$ccount] Converting contest #$cid\n";
        create_contest_repository($cid);
        my $rep = contest_repository($cid);
        my $rep_path = $rep->wc_path;
        $rep->command('config', 'receive.denyCurrentBranch', 'ignore');
        my $problems_id_ref = $dbh->selectcol_arrayref("
            SELECT problem_id FROM contest_problems WHERE contest_id=?
            UNION
            SELECT problem_id FROM reqs WHERE contest_id=?", undef, $cid, $cid);
        foreach my $pid (@$problems_id_ref) {
            mkdir "$rep_path/$pid";
        }

        my $requests_q = $dbh->prepare("SELECT r.id, a.id, a.login, a.email, s.src, r.problem_id
            from sources s
            inner join reqs r on s.req_id=r.id
            inner join accounts a on r.account_id=a.id
            where r.contest_id=?
            order by r.submit_time");
        $requests_q->execute($cid);
        while (my ($rid, $uid, $login, $email, $src, $pid) = $requests_q->fetchrow_array)
        {
            my $fname = "$pid/$uid";
            my $logfname = "$fname.log";

            $email = $email || '';

            open(SRC, ">", $rep_path . $fname);
            binmode(SRC, ":raw");
            print SRC $src;
            close SRC;

            my $log;
            my $query = "select l.dump from reqs r inner join log_dumps l on r.id=l.req_id where r.id=?";
            eval { # Случай, когда может быть очень большой BLOB
                ($log) = $dbh->selectrow_array($query, undef, $rid);
            };
            if ($@)
            {
                print "Big log at $rid\n";
                $query =~ s/\?/$rid/;
                brute_blob_extraction($query, $rep_path . $logfname);
            }
            elsif ($log)
            {
                open(LOG, ">", $rep_path . $logfname);
                binmode(LOG, ":raw");
                print LOG $log;
                close LOG;
            }

            my $log_sha;
            my $src_sha = $rep->hash_and_insert_object($rep_path . $fname);
            $rep->command(add => $fname);
            if ($log)
            {
                $log_sha = $rep->hash_and_insert_object($rep_path . $logfname);
                $rep->command(add => $logfname);
            }
            eval {
                $rep->command(commit => '--allow-empty-message', "--author='$login <$email>'",  '-m', '');
            };
            # Ошибка может быть ровно в 1 случае -- индекс не изменился, просто игнорируем
            open(HEAD, "<", "${rep_path}.git/refs/heads/master");
            my $revision = <HEAD>;
            close HEAD;

            $dbh->do("UPDATE sources SET revision=?, hash=? WHERE req_id=?", undef, $revision, $src_sha, $rid);
            $dbh->do("UPDATE log_dumps SET hash=? WHERE req_id=?", undef, $log_sha, $rid) if $log;
            $dbh->commit or die $dbh->errstr;
        }
        ++$i;
    }
}

# Хитрый хак: DBD::InterBase имеет ограничение 1MB на размер выдаваемого BLOB'а
# Поэтому этой процедурой можно вычленить такой BLOB через консольный вызов isql
sub brute_blob_extraction {
    my ($query, $file) = @_;

    my $out = qx(echo '$query;' | $isql $args);
    if ($out =~ /(\d+:.+)\n/)
    {
        qx(echo 'BLOBDUMP $1 "$file";' | $isql $args);
    }
    else
    {
        die "Sorry, brute extraction didn't help";
    }
}

sub parse_zips {
    my $zname = $_[0];
    my ($zip, $memnum);
    eval {
        $zip = Archive::Zip->new($zname);
        $memnum = $zip && $zip->numberOfMembers;
    };
    return if $@ || !$memnum; # Битые архивы или нулевой длины, и такие бывают
    
    my $mod_time = max map $_->lastModTime, $zip->members;
    my @xml_members = $zip->membersMatching('.*\.xml$');

    die '*.xml not found' if !@xml_members;
    die 'found several *.xml in archive' if @xml_members > 1;

    my $parser = new XML::Parser::Expat;
    $parser->setHandlers(
        Start => \&start_handler,
        End => \&end_handler,
        Char => \&char_handler,
    );
    $parser->parse($zip->contents($xml_members[0]));
    my $pid = $title2pid{$title};
    return unless defined $pid;

    my $record = {
        mod_time => $mod_time,
        file => $File::Find::name,
        author => $author,
    };

    if (exists $pid2history{$pid})
    {
        push @{$pid2history{$pid}}, $record;
    }
    else
    {
        $pid2history{$pid} = [$record];
    }
}

sub traverse_zips {
    if (/.*\.zip$/ && -s)
    {
        eval {
            parse_zips $_;
        };
        print $@ if $@;
    }
}

sub start_handler {
    my ($p, $el, %attrs) = @_;
    if ($el eq "Problem")
    {
        $title = Encode::encode_utf8 $attrs{title};
        $author = Encode::encode_utf8 $attrs{author};
    }
}

sub end_handler {
    my ($p, $el) = @_;
}

sub char_handler
{
    my ($p, $text) = @_;
}

sub convert_problems {
    makedir("$cats_git_storage/problems");
    my $ids_q = $dbh->prepare("SELECT id, title FROM problems");
    $ids_q->execute;
    while(my ($pid, $title) =  $ids_q->fetchrow_array)
    {
        $title2pid{$title} = $pid;
    }

    print "Parsing problems archive...\n";

    find(\&traverse_zips, 'pr');

    print "Exporting archive...\n";

    my $count = keys %pid2history;
    my $i = 1;
    for my $pid (keys %pid2history)
    {
        my @history = sort { $a->{mod_time} <=> $b->{mod_time} } @{$pid2history{$pid}};
        my $rep_path = problem_repository_path $pid;
        create_problem_repository($pid);
        print "[$i/$count] Problem, Export History...\n";
        for (@history)
        {
            my $time = strftime "%d.%m.%Y %H:%M:%S", localtime $_->{mod_time}; 
            my $zname = $_->{file};
            my $author = $_->{author};

            my $rep = problem_repository($pid);
            $rep->command("rm", "-f", "--ignore-unmatch", "*");
            Archive::Zip->new($zname)->extractTree('', "$rep_path/");
            $rep->command("add", "*");

            $rep->command(commit => '--allow-empty-message', "--author='$author <>'", "--date='$time'", '-m', '');
        }
        ++$i;
    }
    ($count) = $dbh->selectrow_array("SELECT COUNT(*) FROM PROBLEMS");
    my $q = $dbh->prepare("SELECT p.id, p.upload_date, a.login, a.email FROM problems p
        LEFT JOIN accounts a ON a.id=p.last_modified_by");
    $q->execute;

    print "Exporting actual problems...\n";
    $i = 1;

    while(my ($pid, $date, $login, $email) =  $q->fetchrow_array)
    {
        print "[$i/$count] Actual problem export...\n";
        $login ||= "";
        $email ||= "";
        my $rep_path = problem_repository_path $pid;
        create_problem_repository($pid) unless -d $rep_path;
        my $repo = problem_repository($pid);

        my $zip_archive;
        my $zip = Archive::Zip->new;
        my $query = "SELECT zip_archive FROM problems where id=?";
        eval {
            $zip_archive = $dbh->selectrow_array($query, undef, $pid);
        };
        my ($fh, $name);
        if ($@)
        {
            print "Too big archive at $pid";
            $name = File::Temp->new(
                TEMPLATE => 'tempXXXXX',
                DIR      => File::Spec->tmpdir,
                SUFFIX   => '.dat',
            )->filename;
            $query =~ s/\?/$pid/;
            brute_blob_extraction $query, $name;
        }
        else
        {
            ($fh, $name) = Archive::Zip::tempFile;
            binmode($fh, ":raw");
            print $fh $zip_archive;
            close $fh;
        }
        # Первые 50 архивов имеют дефекты, удивительно, но zip легко исправляет
        qx(zip -F $name);

        $zip->read($name);
        $repo->command("rm", "-f", "--ignore-unmatch", "*");
        $zip->extractTree('', "$rep_path/");
        $repo->command("add", "*");
        eval {
            $repo->command(commit => '--allow-empty-message', "--author='$login <$email>'", "--date='$date'", '-m', '');
        };
        print "Unchanged...\n" if $@;

        unlink $name;
        ++$i;
    }
}

sub convert_fields {
    convert_users_attempts;
    convert_problems;
}

set_new_root($cats_git_storage);

CATS::DB::sql_connect;
$dbh->{ib_softcommit} = 1;

my @fields_to_delete_pre = (
    ['hash' => 'sources'],
    );

my @fields_to_add = (
    ['revision' => 'sources'],
    ['hash' => 'sources'],
    ['hash' => 'log_dumps'],
    );

my @fields_to_delete_post = (
    );

delfields(@fields_to_delete_pre);
addfields(@fields_to_add);
convert_fields;
delfields(@fields_to_delete_post);
