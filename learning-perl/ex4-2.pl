use common::sense;

sub total {
    my @num = @_;
    my $sum = 0;
    foreach(@num) {
        $sum += $_;
    }
    $sum;
}

my $total = &total(1..1000);
print "The sum from 1 to 1000 is $total.\n";
