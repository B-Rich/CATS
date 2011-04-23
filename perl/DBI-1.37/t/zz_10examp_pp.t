#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/10examp.t' or warn $!;
die if $@;
exit 0
