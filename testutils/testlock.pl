use strict;
BEGIN
{
    push @INC, '../cgi-bin/';
}

use cats;
use cats_misc (':all');

$fatal_error_html_style = 0;

sql_connect;

$dbh->func( 
    -access_mode     => 'read_write',
    -isolation_level => ['read_committed', 'no_record_version'],
    -lock_resolution => 'wait',
    'ib_set_tx_param'
);


for (;;)
{
#    print STDERR "a";
    my $m = $dbh->selectrow_array(qq~SELECT motto FROM accounts WHERE login=?~, {}, $cats::anonymous_login);
    print STDERR $m."\n";

    $dbh->do(qq~UPDATE accounts SET motto='abc' WHERE login=?~, {}, $cats::anonymous_login);

#    print STDERR "b";
    $dbh->commit;
#    print STDERR "c";
}

sql_disconnect;

1;