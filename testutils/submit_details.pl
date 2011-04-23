#!perl -w

# Утилита для просмотра состояния запроса в очереди на тестирование
# параметры:
# submit_details.pl <request_id>


BEGIN
{
    push @INC, '../cgi-bin/';
}

use cats;
use cats_misc (':all');

$fatal_error_html_style = 0;

if (($#ARGV + 1) < 1)
{
    die "Usage: submit_details.pl <request_id>";
}

my ($rid) = @ARGV;

sql_connect;

unless ($dbh->selectrow_array(qq~SELECT COUNT(*) FROM reqs WHERE id=?~, {}, $rid))
{
    die "unknown request id\n";
}               


my ( $jid, $submit_time, $test_time, $result_time, $failed_test, $uid, $pid, $cid, $state ) = 
      $dbh->selectrow_array( qq~SELECT judge_id, CATS_DATE(submit_time), CATS_DATE(test_time), CATS_DATE(result_time),
       failed_test, account_id, problem_id, contest_id, state FROM reqs WHERE id=?~, {}, $rid);
  
my $judge_name = '';
if (defined $jid)
{
    $judge_name = $dbh->selectrow_array( qq~SELECT nick FROM judges WHERE id=?~, {}, $jid);
}


my %states = 
(
    $cats::st_not_processed => "not processed",
    $cats::st_install_processing => "installing problem",
    $cats::st_unhandled_error  => "unhandled_error",
    $cats::st_testing => "testing",
    $cats::st_accepted => "accepted",  
    $cats::st_wrong_answer => "wrong answer on test %d",
    $cats::st_presentation_error => "presentation error on test %d",
    $cats::st_time_limit_exceeded => "time limit exceeded on test %d",
    $cats::st_runtime_error => "runtime error on test %d",
    $cats::st_compilation_error => "compilation error",
    $cats::st_security_violation => "security violation"
);


print 
    "judge_name: $judge_name\n".
    "submit_time: $submit_time\n".
    "test_time: $test_time\n".
    "result_time: $result_time\n".
    "state: ".sprintf ($states{$state}, $failed_test);

if (my ($dump ) =  
    $dbh->selectrow_array( qq~SELECT dump FROM log_dumps WHERE req_id=?~, {}, $rid))
{
    print "judge_dump:\n$dump\n";
}

sql_disconnect;

1;