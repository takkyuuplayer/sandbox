use common::sense;

while (<>) {
    print $_ if /([^ ])\1/;
}

