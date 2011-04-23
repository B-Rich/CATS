#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/04mods.t' or warn $!;
die if $@;
exit 0
