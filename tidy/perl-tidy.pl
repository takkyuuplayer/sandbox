use Test::More;
use Test::Pretty;
subtest 'Array' => sub {
    subtest 'PushAndPop' => sub {
        my @stack = ();
        is scalar @stack, 0;
        push @stack, 'foo';
        is $stack[$#stack], 'foo';
        my $last = pop @stack;
        is $last, 'foo';
        is scalar @stack, 0;
    };
};
done_testing;