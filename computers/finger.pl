while(<>) {
    if(m/^(\w|\d)+\(?c?\)?\s*$/i) {
	print "\n";
	print;
    }
    if(m/^Blitz/) {
	print;
    }
    if(m/^Standard/) {
	print;
    }
    if(m/^Lightning/) {
	print;
    }

}
