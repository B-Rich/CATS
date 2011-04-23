#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/15array.t' or warn $!;
die if $@;
exit 0
