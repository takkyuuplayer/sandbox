use common::sense;

sub total {
    my @num = @_;
    my $sum = 0;
    foreach(@num) {
        $sum += $_;
    }
    $sum;
}
sub average {
    my $total = &total(@_);
    $total / @_;
}
sub above_average {
    my $average = &average(@_);
    my @above = ();
    foreach(@_) {
        push @above, $_ if $_ > $average;
    }
    @above;
}

my @fred = &above_average(1..10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";

my @barney = &above_average(100, 1..10);
print "\@barney is @barney\n";
print "(Should be just 100)\n";
