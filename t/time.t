use strict;
use warnings;
use Test::More;
use Time::Piece::Mutable;

my $time = localtime;
my $epoch = $time->epoch;
$time->sec++;
is $epoch, $time->epoch - 1, 'one second was added';
$epoch = $time->epoch;
$time->min++;
is $epoch, $time->epoch - 60, 'one minute was added';
$epoch = $time->epoch;
$time->hour++;
is $epoch, $time->epoch - 3600, 'one hour was added';

done_testing;
