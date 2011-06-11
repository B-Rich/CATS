#!/usr/bin/env perl

# This script converts existing CATS database
# to the form, applicable for git storage of some BLOBS
# (mostly -- sources)

use strict;
use warnings;
use encoding 'utf8';

use Git;

my ($cats_lib_dir, $cats_git_storage);
BEGIN {
    $cats_lib_dir = $ENV{CATS_DIR} || "./cgi-bin";
    $cats_git_storage = $ENV{CATS_GIT_STORAGE} || "/srv/cats-git";
}

use lib $cats_lib_dir;
use CATS::DB;


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
        my $rows_affected = $dbh->do("ALTER TABLE $table ADD $field VARCHAR(40)");
        die "failed to create column $field" unless defined $rows_affected;
        print "created column $field\n";
    }
    $dbh->commit or die $dbh->errstr;
}


sub addfields {
    my (%tablefields) = @_;
    while (my ($table, $field) = each %tablefields) {
        addfield($table, $field);
    }
}

sub makedir {
    my $dir = shift;
    mkdir $dir unless -d $dir;
}

sub convert_users_attempts {
    makedir("$cats_git_storage/contests");
    my $contests_id_ref = $dbh->selectcol_arrayref("SELECT id FROM contests");
    my $i = 1; # just eyecandy
    foreach my $cid (@$contests_id_ref) {
        print "[$i/" . @$contests_id_ref . "] Converting contest #$cid\n";
        my $rep_path = "$cats_git_storage/contests/$cid/";
        Git::command(init => $rep_path); # create repo
        my $rep = Git->repository(Directory => $rep_path);
        my $problems_id_ref = $dbh->selectcol_arrayref("
            SELECT problem_id FROM contest_problems WHERE contest_id=?
            UNION
            SELECT problem_id FROM reqs WHERE contest_id=?", undef, $cid, $cid);
        foreach my $pid (@$problems_id_ref) {
            mkdir "$rep_path/$pid";
        }

        my $commits_data_ref = $dbh->selectall_arrayref("SELECT r.id, a.id, a.login, a.email, s.src, r.problem_id
            from sources s
            inner join reqs r on s.req_id=r.id
            inner join accounts a on r.account_id=a.id
            where r.contest_id=?
            order by r.submit_time", undef, $cid);
        foreach my $cdr (@$commits_data_ref) {
            my ($rid, $uid, $login, $email, $src, $pid) = @$cdr; # not THAT cdr :)
            my $fname = "$pid/$uid";
            my $logfname = "$fname.log";

            $email = $email || '';

            open(SRC, ">", $rep_path . $fname);
            binmode(SRC, ":raw");
            print SRC $src;
            close SRC;

            my $log;
            eval { # there are some logs, bigger that DBD::Interbase can handle
                ($log) = $dbh->selectrow_array("select l.dump from reqs r inner join log_dumps l on r.id=l.req_id where r.id=?", undef, $rid);
            };
            print "Skipped log dump on rid $rid" if $@;
            open(LOG, ">", $rep_path . $logfname);
            binmode(LOG, ":raw");
            print LOG ($log || "");
            close LOG;

            $rep->command(add => $fname);
            $rep->command(add => $logfname);
            $rep->command(commit => '--allow-empty-message', "--author='$login <$email>'",  '-m', '');
            open(HEAD, "<", "${rep_path}.git/refs/heads/master");
            $dbh->do("UPDATE sources SET src_revspec=? WHERE req_id=?", undef, scalar <HEAD>, $rid);
            $dbh->do("UPDATE log_dumps SET dump_revspec=? WHERE req_id=?", undef, scalar <HEAD>, $rid); # causes redundancy (!)
            close HEAD;
            $dbh->commit or die $dbh->errstr;
        }
        ++$i;
    }
}

sub convert_problems {
    makedir("$cats_git_storage/problems");
    my $problem_id_ref = $dbh->selectcol_arrayref("SELECT id FROM problems");
    # do stuff
}

sub convert_fields {
    convert_users_attempts;
}


CATS::DB::sql_connect;
my %tablefields = (
    'sources' => 'src_revspec',
    'log_dumps' => 'dump_revspec',
    #'problem_sources', => 'src_revspec'
    );
addfields(%tablefields);
convert_fields;
