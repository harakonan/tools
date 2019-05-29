# !/bin/bash
# brew install pandoc

pandoc "$1.md" -f markdown-auto_identifiers -t latex -o "$1_pandoc.tex"

rm $1.tex
echo "% preambles for fonts and page style" >> $1.tex
echo "\documentclass[12pt,a4paper,dvipdfmx,uplatex]{jsarticle}" >> $1.tex
echo "\usepackage[top=25truemm,bottom=25truemm,left=25truemm,right=25truemm]{geometry}" >> $1.tex
echo "\usepackage{newtxtext}" >> $1.tex
echo "\usepackage{newtxmath}" >> $1.tex
echo "" >> $1.tex
echo "% preambles for pandoc transformation" >> $1.tex
echo "\def\tightlist{}" >> $1.tex
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

uplatex.sh $1
