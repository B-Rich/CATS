#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/02dbidrv.t' or warn $!;
die if $@;
exit 0
