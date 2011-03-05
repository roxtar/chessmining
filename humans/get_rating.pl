# Gets rating for blitz games for computers

print "Handle, BlitzRating, BlitzRD, BlitzWon, BlitzLost, BlitzDrawn, BlitzTotal";
while(<>) {
    if(m/^(\w|\d)+\(?c?\)?\s*$/i) {
	print "\n";
	chomp;
	s/\s+$//g;
	print;
    }
    if(m/^Blitz.*/) {
	@fields = split(/\s+/, $_);
	print ", $fields[1], $fields[2], $fields[3], $fields[4], $fields[5], $fields[6]";
    }
}

    
