
LATEX=lualatex
TARGET=slides.tex
#TARGET=tutorial.tex

SKETCHES=$(wildcard sketches/*.sk)
DOT=$(wildcard figs/*.dot)
SVG=$(wildcard figs/*.svg)

all: paper

$(SKETCHES:.sk=.tex): %.tex: %.sk
	sketch $(<) -o $(@)

%.pdf: %.svg
	inkscape --export-pdf $(@) $(<)

%.aux: paper

%.svg: %.dot

	twopi -Tsvg -o$(@) $(<)

thumbs:

	python make_video_preview.py ${TARGET}

bib: $(TARGET:.tex=.aux)

	BSTINPUTS=:./sty bibtex $(TARGET:.tex=.aux)

paper: $(TARGET) $(SVG:.svg=.pdf) $(DOT:.dot=.pdf) $(SKETCHES:.sk=.tex)

	TEXFONTS=:./fonts TEXINPUTS=:.fonts $(LATEX) --shell-escape $(TARGET)

clean:
	rm -f *.vrb *.spl *.idx *.aux *.log *.snm *.out *.toc *.nav *intermediate *~ *.glo *.ist *.bbl *.blg $(SVG:.svg=.pdf) $(DOT:.dot=.svg) $(DOT:.dot=.pdf)

distclean: clean
	rm -f $(TARGET:.tex=.pdf)
