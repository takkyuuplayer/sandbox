use common::sense;

my @names = qw( fred betty barney dino wilma pebbles bamm-bamm );
chomp(my @indexes = <STDIN>);

foreach my $index (@indexes) {
    print $names[$index-1], "\n";
}
