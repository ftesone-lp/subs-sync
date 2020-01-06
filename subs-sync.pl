#!/usr/bin/env perl
use strict;
use warnings;

sub add_milliseconds {
    my ($ms_to_add, $h, $m, $s, $ms) = @_;

    my $t = $h*3600000 + $m*60000 + $s*1000 + $ms + $ms_to_add;

    {
        use integer;
        $h = $t/3600000;
        $m = ($t-$h*3600000)/60000;
        $s = ($t-$h*3600000-$m*60000)/1000;
    }
    $ms = $t-$h*3600000-$m*60000-$s*1000;

    return sprintf "%02d:%02d:%02d,%03d", $h, $m, $s, $ms;
}

if (@ARGV != 2) {
    print "The first argument should be the srt file, the second argument should be the milliseconds to add\n";
    exit 1;
}

my ($file, $ms) = @ARGV;

open(my $input, '<', $file) or die "$!";

my $line;
while ($line = <$input>) {
    if ($line =~ m/(\d{2}):(\d{2}):(\d{2}),(\d{3}) -->/) {
        print add_milliseconds($ms, $1, $2, $3, $4)." --> ";
        $line =~ m/--> (\d{2}):(\d{2}):(\d{2}),(\d{3})/;
        print add_milliseconds($ms, $1, $2, $3, $4)."\n";
    } else {
        print $line;
    }
}

exit 0;
