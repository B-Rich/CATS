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

$fatal_error_html_style = 0;

if (($#ARGV + 1) < 3)
{
    die "Usage: submit.pl <problem_id> <source_file> <de_code>";
}

my ($pid, $file_name, $de_code) = @ARGV;

sql_connect;

my $cid = $dbh->selectrow_array(qq~SELECT id FROM contests WHERE ctype=1~);
unless($cid)
{
    die "training session not declared\n";
}

my $aid = $dbh->selectrow_array(qq~SELECT id FROM accounts WHERE login=?~, {}, $cats::anonymous_login);
unless ($aid)
{
    die "anonymous account not declared\n";     
}

my $did = $dbh->selectrow_array(qq~SELECT id FROM default_de WHERE code=?~, {}, $de_code);
unless ($did)
{
    die "unknown de_code\n";
}

unless ($dbh->selectrow_array(qq~SELECT COUNT(*) FROM problems WHERE id=?~, {}, $pid))
{
    die "unknown problem id\n";
}               

open(FILE, "<$file_name") or die "open source file failed: $!\n";

my ($br, $buffer);
my $src = '';
while ($br = read(FILE, $buffer, 1024)) 
{    
    if (length $src > 32767)
    {
        close(FILE);
        die "source file too long\n";
    }

    $src .= $buffer;
}

close(FILE);


my $rid = new_id;

$dbh->do(qq~INSERT INTO reqs(id, account_id, problem_id, contest_id, 
    submit_time, test_time, result_time, state, received) VALUES(?,?,?,?,CATS_SYSDATE(),CATS_SYSDATE(),CATS_SYSDATE(),?,?)~,
    {}, $rid, $aid, $pid, $cid, $cats::st_not_processed, 0 );
    
my $s = $dbh->prepare(qq~INSERT INTO sources(req_id, de_id, src, fname) VALUES(?,?,?,?)~ );
$s->bind_param(1, $rid);
$s->bind_param(2, $did);
$s->bind_param(3, $src, { ora_type => 113 } ); # blob
$s->bind_param(4, "$file_name");             
$s->execute;

$dbh->commit; 

print "request $rid submitted\n";

1;