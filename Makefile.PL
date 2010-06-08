#!/usr/bin/env perl

use strict;
use warnings;

# Son, when you participate in sporting events,
# it's not whether you win or lose, it's how drunk you get.
use inc::Module::Install;

name 'CPANMetaDB';
abstract 'CPAN Meta-Database';
author 'Zak B. Elep <zakame@cpan.org>';
version '0.01';
license 'mit';
perl_version '5.008001';

requires 'Mojo'                  => '0.9003';
requires 'MojoX::Renderer::YAML' => 0;
requires 'Parse::CPAN::Packages' => 0;
recommends 'Plack'               => 0;
install_script 'CPANMetaDB' ;

WriteAll;
