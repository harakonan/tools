# !bin/bash
# brew install nkf

# change encoding of sql files
# from CP932 to UTF8
find $1 -name "*.sql" -type f | xargs -n 100 nkf -w --overwrite

# usage
# cp932-utf8-sql.sh folder_name
# all sql files under the folder will be changed
