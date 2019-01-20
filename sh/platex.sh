
#!/bin/bash

while getopts b OPTION
do
	case $OPTION in
		b) OPTION_b="TRUE";;
	esac
done
shift $((OPTIND - 1))

platex "$1.tex"

if [ "$OPTION_b" = "TRUE" ]; then
	biber $1
fi

platex "$1.tex"
dvipdfmx "$1.dvi"
open "$1.pdf"
