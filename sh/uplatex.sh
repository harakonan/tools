
#!/bin/bash

while getopts b OPTION
do
	case $OPTION in
		b) OPTION_b="TRUE";;
	esac
done
shift $((OPTIND - 1))

uplatex $1

if [ "$OPTION_b" = "TRUE" ]; then
	biber $1
fi

uplatex $1
dvipdfmx $1
open "$1.pdf"
