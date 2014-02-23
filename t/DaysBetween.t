#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => 'days_between';
zci is_cached => 1;

ddg_goodie_test(
        [qw(
                DDG::Goodie::DaysBetween
        )],
        'days between 01/01/2000 01/01/2001' => test_zci('There are 366 days between 01/01/2000 and 01/01/2001.'),
        'days between 1/1/2000 and 1/1/2001 inclusive' => test_zci('There are 367 days between 1/1/2000 and 1/1/2001, inclusive.'),
        'daysbetween 03/4/2005 and 11/8/2020' => test_zci('There are 5728 days between 03/4/2005 and 11/8/2020.'),
        'days_between 3/14/2005 and 1/2/2003' => test_zci('There are 802 days between 3/14/2005 and 1/2/2003.'), 
        'days between 01/31/2000 01/31/2001' => test_zci('There are 366 days between 01/31/2000 and 01/31/2001.'),
        'days between 01/31/2000 01/31/2001 inclusive' => test_zci('There are 367 days between 01/31/2000 and 01/31/2001, inclusive.'),
);

done_testing;
