#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/80proxy.t' or warn $!;
die if $@;
exit 0
