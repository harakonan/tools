
#!/bin/bash

#convert R file to Rnw file
# 1. Paste contents of R file between '\maketitle{}' and '\end{document}' in the Rnw file
# 2. Remove '# ' before '\', '<<', and '@'
# 3. Compile Rnw file in RStudio
# r-rnw.sh do 2. and open Rnw file with RStudio for you

sed -i 's/\#\ \\/\\/g' $1.Rnw
sed -i 's/\#\ <</\<\</g' $1.Rnw
sed -i 's/\#\ @/@/g' $1.Rnw

open -a RStudio.app $1.Rnw
