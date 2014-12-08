#!/usr/bin/perl
use common::sense;
use Carp ();
use FindBin qw($Bin);

while (<>) {
    chomp;
    if(/\w+a\b/) {
        print "Matched: |$`<$&>$'|\n";
    } else {
        print "No match : |$_|\n";
    }
}
