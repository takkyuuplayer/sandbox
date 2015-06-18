use common::sense;
use Cinnamon::DSL;

set application => 'sandbox';
set repository  => 'git@github.com-tp:takkyuuplayer/sandbox.git';
set user        => 'vagrant';
set rsync_src   => '/tmp/cinnamon-deployment';

role
    vagrant => ['localhost', '127.0.0.1'],
    {
    deploy_to => '/srv/work/cinnamon-deployment',
    branch    => 'master',
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
    call "rsync", $host;
};
