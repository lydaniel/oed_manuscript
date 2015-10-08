FILES=oed.tex
#REF=oed.bib
PSOUTPUT=$(FILES:.tex=.ps)
DVIOUTPUT=$(FILES:.tex=.dvi)
PDFOUTPUT=$(FILES:.tex=.pdf)
BASE=$(FILES:.tex=)

latex : $(FILES)
	echo "Building DVI->PS->PDF Latex"
	latex $(FILES)
	bibtex $(BASE)
	latex $(FILES)
	latex $(FILES)
	dvips -Ppdf -G0 -tletter $(DVIOUTPUT)
	ps2pdf -dPDFSETTINGS=/prepress -dCompatibilityLevel=1.4 -dEmbedAllFonts=true -dSubsetFonts=true -dMaxSubsetPct=100 -sPAPERSIZE=letter $(PSOUTPUT)
	evince $(PDFOUTPUT) &

clean : $(FILES)
	echo "Cleaning all"
	rm *.dvi *.aux *.log *.pdf *.ps

