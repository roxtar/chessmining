PGN_FILES = $(wildcard ../pgn/*.pgn)
ALL_HUMANS_PGN = humans.pgn 
CSV = humans_elo.csv humans_eco.csv
SCRIPTS = ../scripts

all: $(ALL_HUMANS_PGN) $(CSV) humans_list.txt humans_finger.txt humans_blitz_rating.csv
$(ALL_HUMANS_PGN): 
	perl $(SCRIPTS)/filter_pgn.pl $(PGN_FILES) > $@

humans_elo.csv: $(ALL_HUMANS_PGN)
	python $(SCRIPTS)/playerelo.py $< > $@

humans_eco.csv: $(ALL_HUMANS_PGN)
	python $(SCRIPTS)/eco.py $< > $@

humans_list.txt: humans_elo.csv
# Ignore the first line from the humans_elo.csv file and
# generate the humans list
	awk 'NR>1' $< | cut -f1 -d, | sort | uniq > $@

humans_finger.txt: humans_list.txt
	bash $(SCRIPTS)/get_finger.sh $< $@


humans_blitz_rating.csv: humans_finger.txt
# get the rating from finger data
	bash $(SCRIPTS)/get_rating.sh $<  $@

clean:
	rm -rf $(CSV)
	rm -rf *.pyc

.PHONY: clean 