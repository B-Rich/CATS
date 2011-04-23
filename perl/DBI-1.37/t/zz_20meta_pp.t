#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/20meta.t' or warn $!;
die if $@;
exit 0
