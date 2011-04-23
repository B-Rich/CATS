#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/08keeperr.t' or warn $!;
die if $@;
exit 0
