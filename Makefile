%.pdf: %.tex
	pdflatex -shell-escape $<
	- biber $*
	pdflatex -shell-escape $<
	pdflatex -shell-escape $<

clean:
	$(RM) *.log *.aux \
	*.cfg *.glo *.idx *.toc \
	*.ilg *.ind *.out *.lof \
	*.lot *.bbl *.blg *.gls *.cut *.hd \
	*.dvi *.ps *.thm *.tgz *.zip *.rpi \
	*.bcn *.run.xml *.bcf \
	$(RM) -r _minted-*

install:
	curl https://mirrors.ctan.org/macros/latex/contrib/biblatex-contrib/biblatex-software.zip -s -L -o biblatex-software.zip
	unzip -o -q biblatex-software.zip
	cp biblatex-software/software.dbx biblatex-software/software.bbx biblatex-software/*-software.lbx biblatex-software/software-biblatex.sty .

uninstall:
	$(RM) biblatex-software.zip software.dbx software.bbx *-software.lbx software-biblatex.sty
	$(RM) -r biblatex-software
