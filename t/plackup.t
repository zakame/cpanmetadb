#!perl

use strict;
use warnings;

use FindBin;
use Test::More;
use Plack::Test;
use Plack::Util;
use HTTP::Request::Common;

$ENV{MOJO_HOME} = "$FindBin::Bin/../";
my $app = Plack::Util::load_psgi( "$FindBin::Bin/../app.psgi" );

test_psgi $app, sub {
    my $cb  = shift;
    my $res = $cb->(GET "/");
    is $res->code, 200;
    like $res->content, qr/CPAN Meta DB/;

    $res = $cb->(GET "/index.html");
    is $res->code, 200;
    like $res->content, qr/CPAN Meta DB/;

    $res = $cb->(GET "/nonexistent.html");
    is $res->code, 404;

    $res = $cb->(GET "/v1.0/package/App::cpanminus");
    is $res->code, 200;
    like $res->content, qr/distfile:/;
};

done_testing;
