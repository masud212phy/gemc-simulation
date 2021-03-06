use strict;
#use lib ("PERL5LIB");
#use lib ("$ENV{GEMC}/io"); 
#use utils;
#use bank;
use warnings;

our %configuration;

# Help Message                                                                                                                                                                                                                   
#sub help()
#{
#        print "\n Usage: \n";
#        print "   bank.pl <configuration filename>\n";
#        print "   Will create the radiator bank\n";
#        print "   Note: The passport and .visa files must be present to connect to MYSQL. \n\n";
#        exit;
#}

# Make sure the argument list is correct                                                                                                                                                                                         
#if( scalar @ARGV != 1)
#{
#        help();
#        exit;
#}


#our %configuration = load_configuration($ARGV[0]);
#our %configuration;


# One can change the "variation" here if one is desired different from the config.dat
# $configuration{"variation"} = "myvar";

# Variable Type is two chars.
# The first char:
#  D for dgt integrated variables
#  S for raw step by step variables
#  M for digitized multi-hit variables
#  V for voltage(time) variables
#
# The second char:
# i for integers
# d for doubles

#my $bankId   = 1700;
#my $bankId   = 2200;
#my $bankname = "calo";

sub define_bank
{
    my $bankId   = 1700;
    #my $bankId   = 2200;
    my $bankname = "rtpc";

    insert_bank_variable(\%configuration, $bankname, "bankid", $bankId, "Di", "$bankname bank ID");
    insert_bank_variable(\%configuration, $bankname, "pid",         1, "Di", "pid");
    insert_bank_variable(\%configuration, $bankname, "Time",         5, "Dd", "Time [ns]");
    insert_bank_variable(\%configuration, $bankname, "ADC",          6, "Dd", "ADC");
    insert_bank_variable(\%configuration, $bankname, "Ped",          7, "Dd", "Pedestal");
    insert_bank_variable(\%configuration, $bankname, "TimeShift",    8, "Dd", "Time Shift [ns]");
    insert_bank_variable(\%configuration, $bankname, "pz",         16, "Md", "pz");
    #insert_bank_variable(\%configuration, $bankname, "procID",         25, "Di", "Process ID");
    insert_bank_variable(\%configuration, $bankname, "hitn",         99, "Di", "hit number");
}

