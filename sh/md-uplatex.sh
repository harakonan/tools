# !/bin/bash
# brew install pandoc

while getopts l OPTION
do
	case $OPTION in
		l) OPTION_l="TRUE";;
	esac
done
shift $((OPTIND - 1))

md-tex.sh $1

rm $1.tex
echo "% preambles for fonts and page style" >> $1.tex
echo "\documentclass[12pt,a4paper,dvipdfmx,uplatex]{jsarticle}" >> $1.tex
echo "\usepackage[top=25truemm,bottom=25truemm,left=25truemm,right=25truemm]{geometry}" >> $1.tex
echo "\usepackage{newtxtext}" >> $1.tex
echo "\usepackage{newtxmath}" >> $1.tex
echo "\usepackage{hyperref}" >> $1.tex
echo "\usepackage{color}" >> $1.tex

if [ "$OPTION_l" = "TRUE" ]; then
	echo "\usepackage{lscape}" >> $1.tex
fi

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
echo "% preambles for tables" >> $1.tex
echo "\usepackage{longtable}" >> $1.tex
echo "\usepackage{booktabs}" >> $1.tex
echo "" >> $1.tex
echo "\title{}" >> $1.tex
echo "\author{Konan Hara}" >> $1.tex
echo "\date{\today}" >> $1.tex
echo "\begin{document}" >> $1.tex

if [ "$OPTION_l" = "TRUE" ]; then
	echo "\begin{landscape}" >> $1.tex
fi

echo "" >> $1.tex
echo "\input{$1_pandoc.tex}" >> $1.tex
echo "" >> $1.tex

if [ "$OPTION_l" = "TRUE" ]; then
	echo "\end{landscape}" >> $1.tex
fi

echo "\end{document}" >> $1.tex

uplatex.sh $1
