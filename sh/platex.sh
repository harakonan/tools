
#!/bin/bash

platex "$1.tex"
platex "$1.tex"
dvipdfmx "$1.dvi"
open "$1.pdf"
