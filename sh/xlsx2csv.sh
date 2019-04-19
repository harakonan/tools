# !/bin/bash
# pip install xlsx2csv
# brew install --build-from-source catdoc.rb

# convert xlsx/xls to csv with a sheet name
# store xlsx/xls under raw_file_folder
# prepare output_file_folder
# csv will be created in output_file_folder with a designated sheet name

# args
# $1: xlsx or xls
# $2: sheet_name
# $3: file_name_w/o_extension
# $4: sheet_name_attached_to_file_name
# $5: raw_file_folder
# $6: output_file_folder

if [ $1 = xlsx ]; then
	xlsx2csv -n $2 -q 'all' "$5"/"$3".xlsx "$6"/"$3"_"$4".csv
else
	xls2csv -b $2 -q 3 "$5"/"$3".xls > "$6"/"$3"_"$4".csv
fi
