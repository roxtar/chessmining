PGN_FILES = $(wildcard ../pgn/*.pgn)
ALL_COMPUTERS_PGN = computers.pgn 
CSV = computers_elo.csv computers_eco.csv
SCRIPTS = ../scripts

all: computers_finger.txt computers_blitz_rating.csv

#$(ALL_COMPUTERS_PGN): 
#	perl $(SCRIPTS)/filter_pgn.pl $(PGN_FILES) > $@

#computers_elo.csv: $(ALL_HUMANS_PGN)
#	python $(SCRIPTS)/playerelo.py $< > $@

#computers_eco.csv: $(ALL_HUMANS_PGN)
#	python $(SCRIPTS)/eco.py $< > $@


computers_finger.txt: computers_list.txt
	bash $(SCRIPTS)/get_finger.sh $< $@


computers_blitz_rating.csv: computers_finger.txt
# get the rating from finger data
	bash $(SCRIPTS)/get_rating.sh $<  $@

clean:
	rm -rf $(CSV)
	rm -rf *.pyc

.PHONY: clean 