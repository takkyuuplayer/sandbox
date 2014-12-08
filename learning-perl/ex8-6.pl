#!/usr/bin/perl
use common::sense;
use Carp ();
use FindBin qw($Bin);

while (<>) {
    chomp;
    if(/( +$)/) {
        print "end with space : $`|$&|\n";
    }
}
