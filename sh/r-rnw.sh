
#!/bin/bash

sed -i '' 's/\#\ \\/\\/g' $1.Rnw
sed -i '' 's/\#\ <</\<\</g' $1.Rnw
sed -i '' 's/\#\ @/@/g' $1.Rnw

open -a RStudio.app $1.Rnw
