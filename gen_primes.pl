#!/usr/bin/perl

use strict;
use warnings;
use integer;    #  We're only dealing with whole numbers.

#  20210701: Generate primes and output them. Useful as a pre-cursor to the
#  Decade project.

{
    my @primes = ( 2, 3 );
    my $max_value = 10_000_000;

    VALUE:
    for my $v ( 4 .. $max_value ) {

        for my $p ( @primes ) {

            #  If the square of the prime were using is greater than the value
            #  we are checking, we're done. For example, when looking at 97
            #  (which is prime), we don't need to go all the way up to 89 to
            #  see if that's a possible factor -- we can stop when we get to
            #  11, because 11^2 is 121, and that's greater than 97.

            if ( $p * $p > $v ) { last; }
            
            #  If the value we're checking divides cleanly by the prime, it's
            #  not prime and we can move on to the next value.

            if ( $v % $p == 0 ) { next VALUE; }
        }

        #  We fell through, so the number's prime, and we add it to the list.

        push ( @primes, $v );
    }

    print join ( "\n", @primes ) . "\n";
}
