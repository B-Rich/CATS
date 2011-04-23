#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/01basics.t' or warn $!;
die if $@;
exit 0
