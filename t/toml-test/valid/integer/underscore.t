# File automatically generated from BurntSushi/toml-test
use utf8;
use Test2::V0;
use Data::Dumper;
use Math::BigInt;
use Math::BigFloat;
use TOML::Tiny;

binmode STDIN,  ':encoding(UTF-8)';
binmode STDOUT, ':encoding(UTF-8)';

my $expected1 = {
               'kilo' => bless( {
                                  '_file' => '(eval 470)',
                                  '_lines' => [
                                                7
                                              ],
                                  'code' => sub {
                                                BEGIN {${^WARNING_BITS} = "\x55\x55\x55\x55\x55\x55\x55\x55\x55\x55\x55\x55\x15\x00\x04\x40\x05\x04\x50"}
                                                use strict;
                                                no feature ':all';
                                                use feature ':5.16';
                                                require Math::BigInt;
                                                my $got = 'Math::BigInt'->new($_);
                                                'Math::BigInt'->new('1000')->beq($got);
                                            },
                                  'name' => 'Math::BigInt->new("1000")->beq($_)',
                                  'operator' => 'CODE(...)'
                                }, 'Test2::Compare::Custom' ),
               'x' => bless( {
                               '_file' => '(eval 471)',
                               '_lines' => [
                                             7
                                           ],
                               'code' => sub {
                                             BEGIN {${^WARNING_BITS} = "\x55\x55\x55\x55\x55\x55\x55\x55\x55\x55\x55\x55\x15\x00\x04\x40\x05\x04\x50"}
                                             use strict;
                                             no feature ':all';
                                             use feature ':5.16';
                                             require Math::BigInt;
                                             my $got = 'Math::BigInt'->new($_);
                                             'Math::BigInt'->new('1111')->beq($got);
                                         },
                               'name' => 'Math::BigInt->new("1111")->beq($_)',
                               'operator' => 'CODE(...)'
                             }, 'Test2::Compare::Custom' )
             };


my $actual = from_toml(q|kilo = 1_000
x = 1_1_1_1
|);

is($actual, $expected1, 'integer/underscore - from_toml') or do{
  diag 'EXPECTED:';
  diag Dumper($expected1);

  diag '';
  diag 'ACTUAL:';
  diag Dumper($actual);
};

my $regenerated = to_toml $actual;
my $reparsed    = eval{ scalar from_toml $regenerated };
my $error       = $@;

ok(!$error, 'integer/underscore - to_toml - no errors')
  or diag $error;

is($reparsed, $expected1, 'integer/underscore - to_toml') or do{
  diag "ERROR: $error" if $error;

  diag 'INPUT:';
  diag Dumper($actual);

  diag '';
  diag 'REGENERATED TOML:';
  diag Dumper($regenerated);

  diag '';
  diag 'REPARSED FROM REGENERATED TOML:';
  diag Dumper($reparsed);
};

done_testing;