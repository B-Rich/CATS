#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/30subclass.t' or warn $!;
die if $@;
exit 0
