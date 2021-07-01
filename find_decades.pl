#!/usr/bin/perl

use strict;
use warnings;
use integer;    #  We're only dealing with whole numbers.

#  20210701: Find the decades in which all of the numbers that might be prime,
#  really are prime.

use autodie;

my $file_of_primes = '10M-primes.lst';
my %primes;

{
    open ( my $fh, '<', $file_of_primes );
    while (<$fh>) {

        chomp;
        $primes{ $_ } = undef;
    }
    close ( $fh );

    DECADE:
    for my $decade ( 1..999999 ) {

        my @list;
        for my $ones ( qw/1 3 7 9/ ) {

            #  We're creating the target value by multiplying the decade by
            #  ten and adding the ones digit. If that value isn't prime
            #  (because it's not on the list), we're on to the next decade.

            my $target = $decade*10 + $ones;
            exists $primes{ $target } or next DECADE;

            push ( @list, $target );
        }

        print "Decade # $decade (" . join ( ', ', @list ) . ") matches.\n";
    }
}
