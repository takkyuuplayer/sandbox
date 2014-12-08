use common::sense;

while (<>) {
    print $_ if /^[A-Z][^A-Z]*$/;
}

