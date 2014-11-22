#!/usr/bin/perl
use common::sense;
use Carp ();
use FindBin qw($Bin);

use Mojolicious::Lite;

get '/' => {
    text => 'Hello World!!'
};

app->start;
