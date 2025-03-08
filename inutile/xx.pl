use strict;
use warnings;
use JSON;
use POSIX qw(strftime);

my @data;
for my $i (0..9) {
    push @data, { id => $i, value => int(rand(100)) };
}

my $json = JSON->new->pretty->encode(\@data);

open my $fh, '>', 'data.json' or die "Could not open file 'data.json' $!";
print $fh $json;
close $fh;