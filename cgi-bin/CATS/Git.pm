package CATS::Git;
use strict;
use warnings;

use Fcntl qw(:DEFAULT :flock);
use IO::Handle;
use Git;
use CATS::DB;

my $cats_git_storage;

sub set_new_root {
    local $/ = '/';
    ($cats_git_storage) = @_;
    chomp($cats_git_storage);
}

BEGIN {
    use Exporter;
    our @ISA = qw(Exporter);

    our @EXPORT = qw(
                        cpa_from_source_info
                        contest_repository_path
                        contest_repository
                        put_source_in_repository
                        get_source_from_hash
                        get_log_dump_from_hash
                        set_new_root
                   );

    our %EXPORT_TAGS = (all => [ @EXPORT ]);

    set_new_root($ENV{CATS_GIT_STORAGE} || './cats-git');
}

# cpa = contest problem account
sub cpa_from_source_info {
    return ($_[0]{contest_id}, $_[0]{problem_id}, $_[0]{account_id});
}

sub lock_repository {
    my ($repo) = @_;
    sysopen my $fh, "$$repo{opts}{WorkingCopy}/repository.lock", O_WRONLY|O_CREAT;
    flock $fh, LOCK_EX;
    return $fh;
}

sub unlock_repository {
    my ($fh) = @_;
    flock $fh, LOCK_UN;
    close $fh;
}

sub contest_repository_path {
    "$cats_git_storage/contests/$_[0]";
}

sub contest_repository {
    return Git->repository(Directory => contest_repository_path(@_));
}

sub get_source_from_hash {
    my ($cid, $hash) = @_;
    return contest_repository($cid)->command("show", $hash);
}

sub put_source_in_repository {
    my ($cid, $pid, $aid, $src) = @_;
    my $repo = contest_repository($cid);
    my $fname = "$pid/$aid";

    my $lock = lock_repository($repo);

    open SRC, '>', $fname;
    binmode(SRC, ":raw");
    print SRC $src;
    close SRC;

    my ($login, $email) = $dbh->selectrow_array(qq~
        SELECT
            login, email
        FROM accounts
        WHERE account_id = ?~, {}, $aid);
    my $hash = $repo->hash_and_insert_object($repo->wc_path() . $fname);

    $repo->command("add", $fname);
    $repo->command("commit", '--allow-empty-message', "--author='$login <$email>'",  '-m');
    open(HEAD, "<", "$$repo{opts}{Repository}/refs/heads/master");
    my $revision = <HEAD>;
    close HEAD;

    unlock_repository($lock);

    return ($revision, $hash);
}

sub get_log_dump_from_hash {
    my ($cid, $hash) = @_;
    return contest_repository($cid)->command("show", $hash);
}

1;
