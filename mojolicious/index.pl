#!/usr/bin/perl
use common::sense;
use Carp ();
use FindBin qw($Bin);
use lib $Bin . '/../local-git/lib';

use Constants qw(AWS_S3);
use Mojolicious::Lite;
use Amazon::S3;

get '/' => {
    text => 'Hello World!!'
};

get '/s3' => sub {
    my $self = shift;

    my $s3 = Amazon::S3->new({
        aws_access_key_id => AWS_S3()->{access_key},
        aws_secret_access_key => AWS_S3()->{secret_key},
    });
    my $backet = $s3->bucket('tp-sandbox');
    my $response = $backet->get_key('logo.gif');
    $self->res->headers->content_type($response->{content_type});
    $self->res->headers->content_length($response->{content_length});
    $self->render(data => $response->{value});
};

app->start;
