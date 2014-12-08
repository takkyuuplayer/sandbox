#!/usr/bin/perl
use common::sense;
use Carp ();
use FindBin qw($Bin);

while (<>) {
    chomp;
    if(/(?<word>\w+a)\b(?<later>.{0,5})/) {
        print "Matched: line contains |$+{word}|$+{later}\n";
    } else {
        print "No match : |$_|\n";
    }
}
