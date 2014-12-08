#!/usr/bin/perl
use common::sense;
use Carp ();
use FindBin qw($Bin);

while (<>) {
    chomp;
    if(/(?<word>\w+a)\b/) {
        print "Matched: |word contains $+{word}|\n";
    } else {
        print "No match : |$_|\n";
    }
}
