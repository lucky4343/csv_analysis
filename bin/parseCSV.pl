#!/usr/bin/perl
# Date: 1/30/19
# David Brunelle

use strict;
use warnings;
use Text::CSV;

if ($ARGV[0] eq "-Fields") {
    open(my $csv_input, "<", $ARGV[1])
	or die "Cannot open given input: $!";
    
    my $firstln = readline($csv_input);
    my @fields = split("[,]", $firstln);
    my $field_num = scalar @fields;
    print "$field_num \n";
    
    close $csv_input or die "Failure to close File gracefully: $!";
    
}

else {
    my $cfield = $ARGV[0];
    
    my $csv_sep = Text::CSV -> new({sep_char => ','});
    open(my $csv_input, "<", $ARGV[1])
	or die "Cannot open given input: $!";
    
    while (my $line = <$csv_input>){
	if($csv_sep -> parse($line)){
	    
	    my @fields = $csv_sep -> fields();
	    print "$fields[$cfield] \n"
	}
    }
close $csv_input or die "Failure to close File gracefully: $!";
}


