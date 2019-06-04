# !/bin/bash
# brew install pandoc

# transform md to tex using pandoc
pandoc "$1.md" -f markdown-auto_identifiers -t latex -o "$1_pandoc.tex"

# remove \tightlist and \def\labelenumi*{\arabic{enumi*}.}
grep -l '\\tightlist' $1_pandoc.tex | xargs sed -i -e 's/\\tightlist//g' $1_pandoc.tex
grep -l '\\def\\labelenumi*{\\arabic{enumi*}.}' $1_pandoc.tex | xargs sed -i -e 's/\\def\\labelenumi*{\\arabic{enumi*}.}//g' $1_pandoc.tex
