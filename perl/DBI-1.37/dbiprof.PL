# -*- perl -*-

my $file = 'dbiprof';

my $script = <<'SCRIPT';
~startperl~

use strict;

my $VERSION = "1.0";

use DBI::ProfileData;
use Getopt::Long;

# default options
my $number         = 10;
my $sort           = 'total';
my $filename       = 'dbi.prof';
my $reverse        = 0;
my $case_sensitive = 0;
my (%match, %exclude);

# get options from command line
GetOptions(
           'version'        => sub { die "dbiprof $VERSION\n"; },
           'number=i'       => \$number,
           'sort=s'         => \$sort,
           'reverse'        => \$reverse,
           'match=s'        => \%match,
           'exclude=s'      => \%exclude,
           'case-sensitive' => \$case_sensitive,
          );

# list of files defaults to dbi.prof
my @files = @ARGV ? @ARGV : ('dbi.prof');


# instantiate ProfileData object
my $prof;
eval { $prof = DBI::ProfileData->new(Files => \@files) };
die "Unable to load profile data: $@\n" if $@;

# handle matches
while (my ($key, $val) = each %match) {
    if ($val =~ m!^/(.+)/$!) {
        $val = $case_sensitive ? qr/$1/ : qr/$1/i;
    } 
    $prof->match($key, $val, case_sensitive => $case_sensitive);
}

# handle excludes
while (my ($key, $val) = each %exclude) {
    if ($val =~ m!^/(.+)/$!) {
        $val = $case_sensitive ? qr/$1/ : qr/$1/i;
    } 
    $prof->exclude($key, $val, case_sensitive => $case_sensitive);
}

# sort the data
$prof->sort(field => $sort, reverse => $reverse);

# all done, print it out
print $prof->report(number => $number);
exit 0;

__END__

=head1 NAME

dbiprof - command-line client for DBI::ProfileData

=head1 SYNOPSIS

See a report of the ten queries with the longest total runtime in the
profile dump file F<prof1.out>:

 dbiprof prof1.out

See the top 10 most frequently run queries in the profile file
F<dbi.prof> (the default):

  dbiprof --sort count

See the same report with 15 entries:

  dbiprof --sort count --number 15

=head1 DESCRIPTION

This tool is a command-line client for the DBI::ProfileData.  It
allows you to analyze the profile data file produced by
DBI::ProfileDumper and produce various useful reports.

=head1 OPTIONS

This program accepts the following options:

=over 4

=item --number N

Produce this many items in the report.  Defaults to 10.  If set to
"all" then all results are shown.

=item --sort field

Sort results by the given field.  The available sort fields are:

=over 4

=item total

Sorts by total time run time across all runs.  This is the default
sort.

=item longest

Sorts by the longest single run.

=item count

Sorts by total number of runs.

=item first

Sorts by the time taken in the first run.

=item shortest

Sorts by the shortest single run.

=back

=item --reverse

Reverses the selected sort.  For example, to see a report of the
shortest overall time:

  dbiprof --sort total --reverse

=item --match keyN=value

Consider only items where the specified key matches the given value.
Keys are numbered from 1.  For example, let's say you used a
DBI::Profile Path of:

  [ DBIprofile_Statement, DBIprofile_Methodname ]

And called dbiprof as in:

  dbiprof --match key2=execute

Your report would only show execute queries, leaving out prepares,
fetches, etc.

If the value given starts and ends with slashes (C</>) then it will be
treated as a regular expression.  For example, to only include SELECT
queries where key1 is the statement:

  dbiprof --match key1=/^SELECT/

By default the match expression is matched case-insensitively, but
this can be changed with the --case-sensitive option.

=item --exclude keyN=value

Remove items for where the specified key matches the given value.  For
example, to exclude all prepare entries where key2 is the method name:

  dbiprof --exclude key2=prepare

Like C<--match>, If the value given starts and ends with slashes
(C</>) then it will be treated as a regular expression.  For example,
to exclude UPDATE queries where key1 is the statement:

  dbiprof --match key1=/^UPDATE/

By default the exclude expression is matched case-insensitively, but
this can be changed with the --case-sensitive option.

=item --case-sensitive

Using this option causes --match and --exclude to work
case-sensitively.  Defaults to off.

=item --version

Print the dbiprof version number and exit.

=head1 AUTHOR

Sam Tregar <sam@tregar.com>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2002 Sam Tregar

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl 5 itself.

=head1 SEE ALSO

L<DBI::ProfileDumper|DBI::ProfileDumper>,
L<DBI::Profile|DBI::Profile>, L<DBI|DBI>.

=cut

SCRIPT


require Config;
my $config = {};
$config->{'startperl'} = $Config::Config{'startperl'};

$script =~ s/\~(\w+)\~/$config->{$1}/eg;
if (!(open(FILE, ">$file"))  ||
    !(print FILE $script)  ||
    !(close(FILE))) {
    die "Error while writing $file: $!\n";
}
print "Extracted $file from ",__FILE__," with variable substitutions.\n";
