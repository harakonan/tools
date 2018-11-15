
#!/bin/bash

uplatex $1
uplatex $1
dvipdfmx $1
open "$1.pdf"
