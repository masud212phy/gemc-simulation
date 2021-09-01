#!/usr/bin/perl -w

use strict;
#use lib ("$ENV{GEMC}/io");
use lib ("$ENV{GEMC}/output");
use utils;
use bank;

use strict;
use warnings;

#print 

# Help Message
sub help()
{
	print "\n Usage: \n";
	print "   bank.pl <configuration filename>\n";
 	print "   Will create the CLAS12 BONUS bank\n";
 	print "   Note: The passport and .visa files must be present to connect to MYSQL. \n\n";
	exit;
}

# Make sure the argument list is correct
if( scalar @ARGV != 1)
{
	help();
	exit;
}

# Loading configuration file and paramters
our %configuration = load_configuration($ARGV[0]);

# One can change the "variation" here if one is desired different from the config.dat
# $configuration{"variation"} = "myvar";

# Variable Type is two chars.
# The first char:
#  R for raw integrated variables
#  D for dgt integrated variables
#  S for raw step by step variables
#  M for digitized multi-hit variables
#  V for voltage(time) variables
#
# The second char:
# i for integers
# d for doubles

my $bankId   = 1700;
my $bankname = "rtpc";


sub define_bank
{
	
	# uploading the hit definition
	insert_bank_variable(\%configuration, $bankname, "bankid", $bankId, "Di", "$bankname bank ID");
	insert_bank_variable(\%configuration, $bankname, "Sector",       1, "Di", "Sector == 1");
	insert_bank_variable(\%configuration, $bankname, "Layer",        2, "Di", "Pad Column");
	insert_bank_variable(\%configuration, $bankname, "Component",    3, "Di", "Pad Row");
	insert_bank_variable(\%configuration, $bankname, "Order",        4, "Di", "Order == 0");
	insert_bank_variable(\%configuration, $bankname, "Time",         5, "Dd", "Time [ns]");
	insert_bank_variable(\%configuration, $bankname, "ADC",          6, "Dd", "ADC");
	insert_bank_variable(\%configuration, $bankname, "PID",          6, "Di", "PID");
	insert_bank_variable(\%configuration, $bankname, "Ped",          7, "Dd", "Pedestal");
	insert_bank_variable(\%configuration, $bankname, "TimeShift",    8, "Dd", "Time Shift [ns]");
	insert_bank_variable(\%configuration, $bankname, "hitn",         99, "Di", "hit number");
#	insert_bank_variable(\%configuration, $bankname, "trackE",       6, "Rd", "Energy of the track");
#	insert_bank_variable(\%configuration, $bankname, "edep",         7, "Rd", "Energy Deposited");
}

define_bank();

1;
