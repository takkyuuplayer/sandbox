use common::sense;

print `perldoc -u -f atan2`;

print "\n" x 10;

my @lines = `perldoc -u -f atan2`;
foreach (@lines) {
    s/\w<([^>]+)>/\U$1/g;
    print;
}
