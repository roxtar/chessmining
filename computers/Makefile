COMPUTERS_PGN_FILES = $(wildcard ../pgn/computers/*.pgn)
COMPUTERS_FILTERED = $(subst ../pgn/computers/,,$(COMPUTERS_PGN_FILES)) 
COMPUTERS_CSV = $(patsubst %.pgn, %.csv, $(COMPUTERS_FILTERED))
PGN_DIR = ../pgn/computers

SCRIPTS = ../scripts

all: computers_finger.txt computers_blitz_rating.csv $(COMPUTERS_CSV)

csv: $(COMPUTERS_CSV)


$(COMPUTERS_CSV): $(COMPUTERS_FILTERED)
	python $(SCRIPTS)/moves.py $(patsubst %.csv, %.pgn, $@) > $@

$(COMPUTERS_FILTERED): $(COMPUTERS_PGN_FILES)

	perl $(SCRIPTS)/filter_pgn.pl $(PGN_DIR)/$@ > $@


computers_finger.txt: computers_list.txt
	bash $(SCRIPTS)/get_finger.sh $< $@


computers_blitz_rating.csv: computers_finger.txt
# get the rating from finger data
	bash $(SCRIPTS)/get_rating.sh $<  $@

clean:
	rm -rf $(COMPUTERS_CSV) computers_finger.txt computers_blitz_rating.csv $(COMPUTERS_FILTERED)

cleancsv:
	rm -rf $(COMPUTERS_CSV) $(COMPUTERS_FILTERED)

.PHONY: clean 