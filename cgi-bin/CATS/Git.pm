package CATS::Git;
use strict;
use warnings;

use Fcntl qw(:DEFAULT :flock);
use IO::Handle;
use Git;
use CATS::DB;
use CATS::Misc;
use CATS::BinaryFile;

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
                        put_problem_zip
                        get_problem_zip

                        contest_repository_path
                        problem_repository_path
                        contest_repository
                        problem_repository
                        create_contest_repository
                        create_problem_repository

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

sub lock_repository($) {
    my ($repo) = @_;
    sysopen my $fh, "$$repo{opts}{WorkingCopy}/repository.lock", O_WRONLY|O_CREAT;
    flock $fh, LOCK_EX;
    return $fh;
}

sub unlock_repository($) {
    my ($fh) = @_;
    flock $fh, LOCK_UN;
    close $fh;
}

sub create_repository($) {
    Git::command(init => @_);
}

sub get_repository($) {
    return Git->repository(Directory => @_);
}

sub put_problem_zip {
    my ($pid, $zip) = @_;
    my $repo = problem_repository($pid);
    my ($login, $email) = $dbh->selectrow_array("SELECT login, email FROM accounts WHERE id=?", $CATS::Misc::uid);

    lock_repository $repo;
    $repo->command("rm", "-f", "--ignore-unmatch", "*");
    $zip->extractTree('', $repo->wc_path);
    $repo->command("add", "*");
    $repo->command(commit => '--allow-empty-message', "--author='$login <$email>'", '-m', '');
    unlock_repository $repo;
}

sub get_problem_zip {
    my ($pid, $file, $revision) = @_;
    $revision ||= "HEAD";
    my $repo = problem_repository($pid);
    $repo->command("archive", "-o", "$file", $revision);
}

sub contest_repository_path($) {
    return "$cats_git_storage/contests/$_[0]";
}

sub problem_repository_path($) {
    return "$cats_git_storage/problems/$_[0]";
}

sub contest_repository($) {
    return get_repository contest_repository_path $_[0];
}

sub problem_repository($) {
    return get_repository problem_repository_path $_[0];
}

sub create_contest_repository($) {
    return create_repository contest_repository_path $_[0];
}

sub create_problem_repository($) {
    return create_repository problem_repository_path $_[0];
}

sub get_source_from_hash {
    my ($cid, $hash) = @_;
    my $r = contest_repository($cid);
    $r->command("checkout", "--force", "master");
    return $r->command("show", $hash);
}

sub put_source_in_repository {
    my ($cid, $pid, $aid, $src) = @_;
    my $repo = contest_repository($cid);
    my $fname = "$pid/$aid";

    my $lock = lock_repository($repo);

    CATS::BinaryFile::save($repo->wc_path . '/' . $fname, $src);

    my ($login, $email) = $dbh->selectrow_array(qq~
        SELECT
            login, email
        FROM accounts
        WHERE id = ?~, {}, $aid);
    my $hash = $repo->command("hash-object", "-w", $repo->wc_path . $fname);
    #hash_and_insert_object($repo->wc_path . $fname);#$repo->wc_path() . '/' . $fname);
    # dunno why, but Git.pm refuses to hash it, so screw it

    $repo->command("add", $fname);
    $repo->command("commit", '--allow-empty-message', "--author='$login <$email>'",  '-m', '');
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
