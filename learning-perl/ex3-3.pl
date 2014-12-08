use common::sense;

chomp(my @strings = <STDIN>);
my @sorted = sort @strings;
print "@sorted\n";

for my $string (@sorted) {
    print "$string\n";
}
