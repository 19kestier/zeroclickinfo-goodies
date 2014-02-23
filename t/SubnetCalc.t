#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use DDG::Test::Goodie;

zci answer_type => 'subnet_info';
zci is_cached => 1;

ddg_goodie_test(
    [
        # This is the name of the goodie that will be loaded to test.
        'DDG::Goodie::SubnetCalc'
    ],
    "10.0.0.0/24" => test_zci(
	"Network: 10.0.0.0/24 (Class A)\nNetmask: 255.255.255.0\nSpecified: Network\nHost Address Range: 10.0.0.1-10.0.0.254 (254 hosts)\nBroadcast: 10.0.0.255\n",
	html => "<div><i>Network: </i>10.0.0.0/24 (Class A)</div><div><i>Netmask: </i>255.255.255.0</div><div><i>Specified: </i>Network</div><div><i>Host Address Range: </i>10.0.0.1-10.0.0.254 (254 hosts)</div><div><i>Broadcast: </i>10.0.0.255</div>",
    ),
    "192.168.0.0/24" => test_zci(
	"Network: 192.168.0.0/24 (Class C)\nNetmask: 255.255.255.0\nSpecified: Network\nHost Address Range: 192.168.0.1-192.168.0.254 (254 hosts)\nBroadcast: 192.168.0.255\n",
	html => "<div><i>Network: </i>192.168.0.0/24 (Class C)</div><div><i>Netmask: </i>255.255.255.0</div><div><i>Specified: </i>Network</div><div><i>Host Address Range: </i>192.168.0.1-192.168.0.254 (254 hosts)</div><div><i>Broadcast: </i>192.168.0.255</div>",
    ),
    "8.8.8.8 255.255.224.0" => test_zci(
	"Network: 8.8.0.0/19 (Class A)\nNetmask: 255.255.224.0\nSpecified: Host #2056\nHost Address Range: 8.8.0.1-8.8.31.254 (8190 hosts)\nBroadcast: 8.8.31.255\n",
	html => "<div><i>Network: </i>8.8.0.0/19 (Class A)</div><div><i>Netmask: </i>255.255.224.0</div><div><i>Specified: </i>Host #2056</div><div><i>Host Address Range: </i>8.8.0.1-8.8.31.254 (8190 hosts)</div><div><i>Broadcast: </i>8.8.31.255</div>",
    ),
    '46.51.197.88/255.255.254.0' => test_zci(
        "Network: 46.51.196.0/23 (Class A)\nNetmask: 255.255.254.0\nSpecified: Host #344\nHost Address Range: 46.51.196.1-46.51.197.254 (510 hosts)\nBroadcast: 46.51.197.255\n",
        html => '<div><i>Network: </i>46.51.196.0/23 (Class A)</div><div><i>Netmask: </i>255.255.254.0</div><div><i>Specified: </i>Host #344</div><div><i>Host Address Range: </i>46.51.196.1-46.51.197.254 (510 hosts)</div><div><i>Broadcast: </i>46.51.197.255</div>',
    ),
    '176.34.131.233/32' => test_zci(
        "Network: 176.34.131.233/32 (Class B)\nNetmask: 255.255.255.255\nSpecified: Host Only\n",
        html => '<div><i>Network: </i>176.34.131.233/32 (Class B)</div><div><i>Netmask: </i>255.255.255.255</div><div><i>Specified: </i>Host Only</div>'
    ),
);

done_testing;
