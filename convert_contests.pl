#!/usr/bin/env perl

# This script converts existing CATS database
# to the form, applicable for git storage of some BLOBS
# (mostly -- sources)

use strict;
use warnings;
use encoding 'utf8';

use Git::Repository;

my ($cats_lib_dir, $cats_git_storage);
BEGIN {
    $cats_lib_dir = $ENV{CATS_DIR} || "./cgi-bin";
    $cats_git_storage = $ENV{CATS_GIT_STORAGE} || "./cgi-bin/cats-git";
}

use lib $cats_lib_dir;
use CATS::DB;

CATS::DB::sql_connect;

unless (-d "$cats_git_storage/contests") {
    mkdir "$cats_git_storage/contests";
}

my @hasfield = $dbh->selectrow_array(q~
SELECT
    RDB$RELATION_FIELDS.RDB$FIELD_NAME
FROM
    RDB$RELATION_FIELDS
WHERE
    RDB$RELATION_FIELDS.RDB$RELATION_NAME = UPPER('contests')
    AND RDB$RELATION_FIELDS.RDB$FIELD_NAME = UPPER('revspec');
~);
unless (@hasfield) {
    print "not has!\n";
    my $a = $dbh->do("ALTER TABLE sources ADD revspec VARCHAR(40)");
    print "affected $a\n";
    $dbh->commit or die $dbh->errstr;
}

my $contests_id_ref = $dbh->selectcol_arrayref("SELECT id FROM contests");
my $i = 1;
foreach my $cid (@$contests_id_ref) {
    print "[$i/" . @$contests_id_ref . "] Converting contest #$cid\n";
    my $rep_path = "$cats_git_storage/contests/$cid/";
    Git::Repository->run(init => $rep_path); # create repo
    my $rep = Git::Repository->new(work_tree => $rep_path, {
        env => {
            GIT_COMMITTER_NAME => 'CATS',
            GIT_COMMITTER_EMAIL => 'klenin@imcs.dvgu.ru',
        }
    });
    my $problems_id_ref = $dbh->selectcol_arrayref("
SELECT problem_id FROM contest_problems WHERE contest_id=?
UNION
SELECT problem_id FROM reqs WHERE contest_id=?", undef, $cid, $cid);
    foreach my $pid (@$problems_id_ref) {
        mkdir "$rep_path/$pid";
    }
    
    my $commits_data_ref = $dbh->selectall_arrayref("SELECT r.id, a.id, a.login, a.email, s.src, r.problem_id from
        sources s inner join reqs r on s.req_id=r.id
        inner join accounts a on r.account_id=a.id
        where r.contest_id = ?
        order by r.submit_time", undef, $cid);
    foreach my $cdr (@$commits_data_ref) {
        my ($rid, $uid, $login, $email, $src, $pid) = @$cdr;
        my $fname = "$pid/$uid";

        open(SRC, ">", $rep_path . $fname);
        binmode(SRC, ":raw");
        print SRC $src;
        close SRC;

        $rep->run(add => $fname);
        $rep->run('commit', '--allow-empty-message', '-m', '', {
            env => {
                GIT_AUTHOR_NAME => $login,
                GIT_AUTHOR_EMAIL => $email || '',
            }
        });
        my $revspec = $rep->command('rev-list', '-n', 1, 'HEAD')->stdout->getline();
        $dbh->do("UPDATE sources SET revspec=? WHERE req_id=?", undef, $revspec, $rid);
    }
    ++$i;
}

