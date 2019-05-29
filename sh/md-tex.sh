# !/bin/bash
# brew install pandoc

pandoc "$1.md" -f markdown-auto_identifiers -t latex -o "$1_pandoc.tex"
