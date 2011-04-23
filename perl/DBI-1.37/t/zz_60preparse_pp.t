#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/60preparse.t' or warn $!;
die if $@;
exit 0
