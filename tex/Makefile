OUTPUT = project_chess.pdf
INPUT = project_chess
all: $(OUTPUT)

%.pdf: $(INPUT).tex $(INPUT).bib
	pdflatex $(INPUT)
	bibtex $(INPUT)
	pdflatex $(INPUT)
	pdflatex $(INPUT)


view:
	evince $(OUTPUT) &

clean:
	rm -f *.log *.aux *.pdf

.PHONY: clean 