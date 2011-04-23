#!perl -w
use threads;
$ENV{DBI_PUREPERL}=2;
do 't/05thrclone.t' or warn $!;
die if $@;
exit 0
