use strict;
use warnings;
use Test::More 'no_plan';
use CPANPLUS::Configure;
use CPANPLUS::Backend;

my $conf = CPANPLUS::Configure->new();
$conf->set_conf( enable_custom_sources => 0 );
$conf->set_conf( no_update => '1' );
$conf->set_conf( source_engine => 'CPANPLUS::Internals::Source::MetaCPAN' );
my $cb = CPANPLUS::Backend->new($conf);
my $mod = $cb->parse_module( module => 'Env::Sanctify' );
isa_ok( $mod, 'CPANPLUS::Module' );
