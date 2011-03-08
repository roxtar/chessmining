PGN_FILES =  $(wildcard data/*.pgn)
ALL_HUMANS_PGN = humans.pgn 
CSV = humans_elo.csv humans_eco.csv

all: $(ALL_HUMANS_PGN) $(CSV) humans_list.txt

$(ALL_HUMANS_PGN): 
	perl filter_pgn.pl data/*.pgn > $@

humans_elo.csv: $(ALL_HUMANS_PGN)
	python playerelo.py $< > $@

humans_eco.csv: $(ALL_HUMANS_PGN)
	python eco.py $< > $@

humans_list.txt: humans_elo.csv
	awk 'NR>1' $< | cut -f1 -d, | sort | uniq > $@



test:
	python *_test.py

clean:
	rm -rf $(CSV)
	rm -rf *.pyc

.PHONY: test clean