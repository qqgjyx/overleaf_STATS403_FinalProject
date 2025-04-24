##
SHELL := /bin/bash # Use bash syntax

MAIN = main
# "make" target

all: pdf

interactive:			## Interactively build PDF when changing sources
	latexmk -pdf -pdflatex="pdflatex" -pvc $(MAIN)


pdf:					## PDF compilation
	latexmk -pdf -pdflatex="pdflatex --synctex=1 '\input{$(MAIN)}'" $(MAIN)


update: up				## svn update
up:
	svn up ./../ ./


clean:				## clean-up
	rm -f *.bbl *.blg *.log *.aux *.nav *.out *.snm *.synctex.gz *.toc \
	      $(MAIN).pdf *.vrb *.bcf *.run.xml *.xwm *~ *.fdb_latexmk, *-blx.bib
	rm -f sections/*.{log,bu}
	rm -f sections/*~
	rm -f preamble/*~
