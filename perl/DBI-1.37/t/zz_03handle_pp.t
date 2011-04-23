#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/03handle.t' or warn $!;
die if $@;
exit 0
