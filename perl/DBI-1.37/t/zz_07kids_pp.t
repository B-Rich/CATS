#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/07kids.t' or warn $!;
die if $@;
exit 0
