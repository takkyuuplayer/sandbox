use common::sense;

my %word_counts;
while (<>) {
    chomp;
    $word_counts{$_} += 1;
}

for my $key (sort keys %word_counts) {
    printf "%10s is %2d times appeared\n", $key, $word_counts{$key};
}
