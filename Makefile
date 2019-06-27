BASENAME=matze_fruehstueckt
PAPERSIZE=a5
ENCODING=iso-8859-15

$(BASENAME).pdf: $(wildcard *.tex) $(wildcard *.bib)
	@LOOP=1; while :; do \
		echo "***** Running pass $$LOOP..."; let LOOP+=1; \
		xelatex -interaction=nonstopmode --shell-escape $(BASENAME).tex >/dev/null || { echo "latex failed"; cat $(BASENAME).log; exit 2; }; \
		makeindex -s nomencl.ist $(BASENAME).nlo -o $(BASENAME).nls >/dev/null || { echo "makeindex failed"; break; }; \
		splitindex -m 'texindy -L german-din' $(BASENAME).idx >/dev/null || { echo "splitindex failed"; break; }; \
		bibtex $(BASENAME) >/dev/null || { echo "bibtex failed"; break; }; \
		grep 'Rerun to get' $(BASENAME).log || break; \
	done
	@cat $(BASENAME).log
	@dvips -t $(PAPERSIZE) -o $(BASENAME).ps $(BASENAME).dvi || { echo "dvips failed"; exit 1; }
	@ps2pdf14 $(BASENAME).ps $(BASENAME).pdf || { echo "ps2pdf14 failed"; exit 1; }

clean:
	@rm -f *.aux *.idx *.ind *.bbl *.blg *.dvi *.ilg *.lo[afgt] *.maf *.mtc *.mtc0 *.nl[os] *.ps *.ptc? *.ptc?? *.toc *.out

stats:
	@texcount -enc=$(ENCODING) -inc -html $(BASENAME).tex > $(BASENAME).html

.PHONY: clean stats
