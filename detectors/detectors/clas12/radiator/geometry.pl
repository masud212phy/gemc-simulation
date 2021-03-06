use strict;
use warnings;

our %configuration;


sub makeRadiator
{

	my $minAngle = 0.3;   # degrees
	my $maxAngle = 5;  # degrees
	my $zpos     = -35; # cm
	#my $zpos     = -95.0; # cm
	my $thick    = 0.1;   # cm
	# rad length = 1.436 cm
	#my $thick = 0.07; #cm 10%
	#my $thick = 0.007; #cm 1%
	# 0.036 cm 5%
	# 0.050 cm 7%
	# 0.065 cm 9%
	my $IR = $zpos*tan(rad($minAngle));
	my $OR = $zpos*tan(rad($maxAngle));

	my %detector = init_det();
	$detector{"name"}        = "radiator";
	$detector{"mother"}      = "root";
	#$detector{"mother"}      = "rtpc"; 
	$detector{"description"} = "Cu radiator at z=-30cm";
	$detector{"pos"}         = "0*cm 0*cm $zpos*cm";
	#$detector{"pos"}         = "0*cm 0*cm 0*cm";
	$detector{"color"}       = "33bb99";
	#$detector{"type"}        = "Tube";
	$detector{"type"}         = "Box";
	#$detector{"dimensions"}  = "$dimension*cm $dimension*cm $dimension*cm";
	$detector{"dimensions"}  = "1*cm 1*cm 0.05*cm";
	#$detector{"dimensions"}  = "1*cm 1*cm 0.065*cm";
	#$detector{"material"}    = "G4_AIR";
	$detector{"material"}    = "G4_Cu";
	#$detector{"material"}   ="scintillator";
	$detector{"visible"}     = 1;
	$detector{"style"}       = 1;
	#$detector{"sensitivity"} = "radiator";
	#$detector{"hit_type"}    = "flux";
	#$detector{"identifiers"} = "id manual 1";
	print_det(\%configuration, \%detector);
}

