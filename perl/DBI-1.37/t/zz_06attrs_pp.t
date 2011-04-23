#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/06attrs.t' or warn $!;
die if $@;
exit 0
