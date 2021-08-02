# File automatically generated from BurntSushi/toml-test
use utf8;
use Test2::V0;
use Data::Dumper;
use Math::BigInt;
use Math::BigFloat;
use TOML::Tiny;

local $Data::Dumper::Sortkeys = 1;
local $Data::Dumper::Useqq    = 1;

binmode STDIN,  ':encoding(UTF-8)';
binmode STDOUT, ':encoding(UTF-8)';

open my $fh, '<', "./t/toml-test/valid/table/names.toml" or die $!;
binmode $fh, ':encoding(UTF-8)';
my $toml = do{ local $/; <$fh>; };
close $fh;

my $expected1 = {
               "a" => {
                        " x " => {},
                        "b" => {
                                 "c" => {}
                               },
                        "b.c" => {},
                        "d.e" => {}
                      },
               "d" => {
                        "e" => {
                                 "f" => {}
                               }
                      },
               "g" => {
                        "h" => {
                                 "i" => {}
                               }
                      },
               "j" => {
                        "\x{29e}" => {
                                       "l" => {}
                                     }
                      },
               "x" => {
                        "1" => {
                                 "2" => {}
                               }
                      }
             };


my $actual = from_toml($toml);

is($actual, $expected1, 'table/names - from_toml') or do{
  diag 'TOML INPUT:';
  diag "$toml";

  diag '';
  diag 'EXPECTED:';
  diag Dumper($expected1);

  diag '';
  diag 'ACTUAL:';
  diag Dumper($actual);
};

my $regenerated = to_toml $actual;
my $reparsed    = eval{ scalar from_toml $regenerated };
my $error       = $@;

ok(!$error, 'table/names - to_toml - no errors')
  or diag $error;

is($reparsed, $expected1, 'table/names - to_toml') or do{
  diag "ERROR: $error" if $error;

  diag '';
  diag 'PARSED FROM TEST SOURCE TOML:';
  diag Dumper($actual);

  diag '';
  diag 'REGENERATED TOML:';
  diag $regenerated;

  diag '';
  diag 'REPARSED FROM REGENERATED TOML:';
  diag Dumper($reparsed);
};

done_testing;