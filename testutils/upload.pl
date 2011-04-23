#!perl -w

# Утилита для отсылки задания на тестирования из командной строки.
# Задание отсылается в контексте тренировочной сессии под анонимнмым аккаунтом
# параметры:
# submit.pl <problem_id> <source_file> <de_code>


BEGIN
{
    push @INC, '../cgi-bin/';
}

use cats;
use cats_misc (':all');
use problem;

$fatal_error_html_style = 0;

if (($#ARGV + 1) < 1)
{
    die "Usage: upload.pl <package.zip> [pid]";
}

my ($file_name, $pid) = @ARGV;

sql_connect;

my $cid = $dbh->selectrow_array(qq~SELECT id FROM contests WHERE ctype=1~);
unless($cid)
{
    die "training session not declared\n";
}

my $replace = 1;
if (!defined $pid)
{
    $pid = new_id;
    print "pid: $pid\n";
    $replace = 0;
}

my ($st, $import_log) = problem::import_problem($file_name, $cid, $pid, $replace);


print $import_log;

if (!$replace && !$st)
{   
    $st |= !$dbh->do(qq~INSERT INTO contest_problems(id, contest_id, problem_id, code) VALUES (?,?,?,NULL)~, 
    {}, new_id, $cid, $pid);
}

(!$st) ? $dbh->commit : $dbh->rollback;

sql_disconnect;

1;