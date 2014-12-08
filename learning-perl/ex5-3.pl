use common::sense;

print "format length: ";
chomp(my $length = <STDIN>);

my @lines;
foreach(<STDIN>) {
    chomp;
    push @lines, $_;
}

print "----5----0" x ($length/10+1) , "\n";
foreach(@lines) {
    printf "%${length}s\n", $_;
}
