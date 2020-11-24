
LATEX=lualatex

TEXTARGETS=$(wildcard ./*.tex)

TARGET=$(TEXTARGETS:.tex=.pdf)

DOT=$(wildcard figs/*.dot)
SVG=$(wildcard figs/*.svg)

MODE ?= batchmode

all: paper

$(DOT:.dot=.pdf): %.pdf: %.svg
$(SVG:.svg=.pdf): %.pdf: %.svg
	inkscape -o $(@) $(<)

%.aux: paper

%.svg: %.dot
	dot -Tsvg -o$(@) $(<)

%.thumbs: %.tex
	./make_video_preview.py $<

bib: $(TARGET:.tex=.aux)
	BSTINPUTS=:./style bibtex $(TARGET:.tex=.aux)

%.pdf: %.tex
	TEXINPUTS=:style $(LATEX) --interaction=$(MODE) -shell-escape `basename $<`; if [ $$? -gt 0 ]; then echo "Error while compiling $<"; touch `basename $<`; fi; \

paper: $(SVG:.svg=.pdf) $(DOT:.dot=.pdf) $(TARGET)

thumbs: $(TARGET:.pdf=.thumbs)

touch:
	touch $(TEXTARGETS)

force: touch paper

%.nup: %.pdf
	#pdfnup --nup 2x5 --no-landscape $<
	pdfnup --nup 2x5 --no-landscape --delta '2cm 0.45cm' --scale 0.9 $<

nup: $(TARGET:.pdf=.nup)

clean:
	rm -f *.vrb *.spl *.idx *.aux *.log *.snm *.out *.toc *.nav *intermediate *~ *.glo *.ist *.bbl *.blg _minted* $(SVG:.svg=.pdf) $(DOT:.dot=.svg) $(DOT:.dot=.pdf)

distclean: clean
	rm -f $(TARGET:.tex=.pdf)
