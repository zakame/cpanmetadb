#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Test::Mojo;

use FindBin;
$ENV{MOJO_HOME} = "$FindBin::Bin/../";
require "$ENV{MOJO_HOME}/CPANMetaDB";

# Test
my $t = Test::Mojo->new;

$t->get_ok('/index.html')
  ->status_is(200)->content_type_is('text/html')
  ->content_like(qr#CPAN Meta DB#i);

$t->get_ok('/')
  ->status_is(200)->content_type_is('text/html')
  ->content_like(qr#CPAN Meta DB#i);

$t->get_ok('/v1.0/package/App::cpanminus')
  ->status_is(200)->content_type_is('text/x-yaml')
  ->content_like(qr#distfile: M/MI/MIYAGAWA/App-cpanminus-#i);

$t->get_ok('/v1.0/package/Some::Nonexistent::Module')
  ->status_is(404)->content_type_is('text/html');

done_testing;
