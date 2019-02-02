#!/usr/bin/perl
use strict;
use warnings;

my $csv_pattern = "[,]"; #"[^\"]*\""; 

open(my $csv_input, "<", "test3.csv")
    or die "Cannot open given input: $!";

my $firstln = readline($csv_input);

my @fields = split("[,]", $firstln);
my $field_num = scalar @fields;
my @fields_match = (0..$field_num);
while (my $line = <$csv_input>){
    if($line =~ $csv_pattern){
	print split("[,]", $line);
    }
}
print "@fields";

#print $firstln;

close $csv_input or die "Failure to close File gracefully: $!";

