#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/41prof_dump.t' or warn $!;
die if $@;
exit 0
