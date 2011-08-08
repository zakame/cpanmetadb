#!/usr/bin/env perl

use 5.008007;

use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME      => 'CPANMetaDB',
  VERSION   => '0.02',
  AUTHOR    => 'Zak B. Elep <zakame@cpan.org>',
  EXE_FILES => ['CPANMetaDB', 'CPANMetaDB-worker'],
  PREREQ_PM => {
    'LWP::Simple'           => 0,
    'Mojolicious'           => '1.0',
    'Parse::CPAN::Packages' => 0,
    'Plackup'               => 0,
  },
  test => {TESTS => 't/*.t t/*/*.t t/*/*/*.t'}
);
