# !bin/bash
# brew install nkf

# change encoding of sql files
# from UTF8 to CP932
find $1 -name "*.sql" -type f | xargs -n 100 nkf -s --overwrite

# usage
# utf8-cp932-sql.sh folder_name
# all sql files under the folder will be changed
