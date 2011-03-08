while(<>) {
    if(m/^.* Finger of (.+):\s*$/i) {
	print "\n";
	print "$1\n";
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
