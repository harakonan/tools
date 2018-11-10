
#!/bin/bash

markdown-pdf -o "$1.pdf" "$1.md"
open "$1.pdf"
