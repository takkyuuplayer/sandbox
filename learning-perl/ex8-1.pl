#!/usr/bin/perl
use common::sense;
use Carp ();
use FindBin qw($Bin);

while (<>) {
    chomp;
    if(/match/) {
        print "Matched: |$`<$&>$'|\n";
    } else {
        print "No match : |$_|\n";
    }
}
