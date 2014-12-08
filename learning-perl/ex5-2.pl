use common::sense;

print "----5----0" x 3, "\n";
my @strings = qw( hello good-bye );
foreach (@strings) {
    printf "%20s\n", $_;
}
