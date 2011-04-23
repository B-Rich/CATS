#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/42prof_data.t' or warn $!;
die if $@;
exit 0
