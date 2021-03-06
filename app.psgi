#!/usr/bin/env perl

use Mojo::Server::PSGI;
use Plack::Builder;

require "CPANMetaDB";

my $psgi = Mojo::Server::PSGI->new( app_class => 'CPANMetaDB' );
my $app = sub { $psgi->run(@_) };
