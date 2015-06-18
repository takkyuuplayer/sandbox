use common::sense;
use Cinnamon::DSL;

set application => 'sandbox';
set repository  => 'git@github.com-tp:takkyuuplayer/sandbox.git';
set user        => 'vagrant';
set rsync_src   => '/tmp/cinnamon-deployment';

role
    vagrant => ['localhost'],
    {
    deploy_to => '/srv/work/cinnamon-deployment',
    branch    => 'master',
    };

task setup => sub {
    my ($host)     = @_;
    my $repository = get('repository');
    my $rsync_src  = get('rsync_src');
    my $deploy_to  = get('deploy_to');
    my $branch     = 'origin/' . get('branch');
    run "rm",  '-rf',      $rsync_src;
    run "git", "clone",    $repository, $rsync_src;
    # run "cd", "$rsync_src"; # XXX something wrong
    run "git", 'checkout', '-q', $branch;
};

task rsync => sub {
    my ($host)    = @_;
    my $user      = get('user');
    my $rsync_src = get('rsync_src');
    my $deploy_to = get('deploy_to');
    run "rsync", "-az", $rsync_src, "$user\@$host:$deploy_to";
};

task deploy => sub {
    my ($host) = @_;
    call "setup", $host;
    call "rsync", $host;
};

__END__

=encoding utf-8

=head1 SYNOPSIS

At your shell,

    % carton exec -- cinnamon vagrant deploy
