# !/bin/bash
# pip install xlsx2csv
# brew install --build-from-source catdoc.rb

# convert xlsx/xls to csv with a sheet name
# store xlsx/xls under raw file folder
# prepare output file folder
# csv will be created in output file folder with a designated sheet name

# args
# $1: xlsx or xls
# $2: sheet name
# $3: file name w/o extension
# $4: new file name
# $5: raw file folder
# $6: output file folder

if [ $1 = xlsx ]; then
	xlsx2csv -n $2 -q 'all' "$5"/"$3".xlsx "$6"/"$4".csv
else
	xls2csv -b $2 -q 3 "$5"/"$3".xls > "$6"/"$4".csv
fi
