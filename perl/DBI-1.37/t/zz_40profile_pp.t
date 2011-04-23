#!perl -w
$ENV{DBI_PUREPERL}=2;
do 't/40profile.t' or warn $!;
die if $@;
exit 0
