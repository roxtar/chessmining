OUTPUT = project_chess.pdf

all: $(OUTPUT)

%.pdf: %.tex
	pdflatex $<
	pdflatex $<


view:
	evince $(OUTPUT) &

clean:
	rm -f *.log *.aux *.pdf