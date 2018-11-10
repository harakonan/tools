# !bin/bash
# brew install nkf

# change encoding of csv files
# from CP932 to UTF8
find $1 -name "*.csv" -type f | xargs -n 100 nkf -w --overwrite

# usage
# cp932-utf8-csv.sh folder_name
# all sql files under the folder will be changed
