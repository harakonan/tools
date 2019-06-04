# !/bin/bash
# brew install pandoc

md-tex.sh $1

rm $1.tex
echo "% preambles for fonts and page style" >> $1.tex
echo "\documentclass[12pt]{article}" >> $1.tex
echo "\usepackage[top=25truemm,bottom=25truemm,left=25truemm,right=25truemm]{geometry}" >> $1.tex
echo "\usepackage{newtxtext}" >> $1.tex
echo "\usepackage{newtxmath}" >> $1.tex
echo "\geometry{a4paper}" >> $1.tex
echo "" >> $1.tex
echo "% preambles for deeply nested lists" >> $1.tex
echo "\usepackage{enumitem}" >> $1.tex
echo "\setlistdepth{20}" >> $1.tex
echo "\renewlist{itemize}{itemize}{20}" >> $1.tex
echo "\setlist[itemize]{label=\textbullet}" >> $1.tex
echo "" >> $1.tex
echo "% preambles for unnumbered sections" >> $1.tex
echo "\setcounter{secnumdepth}{0}" >> $1.tex
echo "" >> $1.tex
echo "% preambles for hyperlink" >> $1.tex
echo "\usepackage{hyperref}" >> $1.tex
echo "" >> $1.tex
echo "\title{}" >> $1.tex
echo "\author{Konan Hara}" >> $1.tex
echo "\date{\today}" >> $1.tex
echo "\begin{document}" >> $1.tex
echo "" >> $1.tex
echo "\input{$1_pandoc.tex}" >> $1.tex
echo "" >> $1.tex
echo "\end{document}" >> $1.tex

pdflatex $1
pdflatex $1
open "$1.pdf"
