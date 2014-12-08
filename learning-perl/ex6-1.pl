use common::sense;

my %family_names = (
    'fred' => 'flintstone',
    'barney' => 'rubble',
    'wilma' => 'flintstone',
);

while(<STDIN>) {
    chomp;
    print "famliy name for $_ is $family_names{$_}", "\n";
}
