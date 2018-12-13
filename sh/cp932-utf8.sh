# !bin/bash
# brew install nkf

# change encoding of files with a designated extension
# from CP932 to UTF8
find $1 -name "*.$2" -type f | xargs -n 100 nkf -w --overwrite

# usage
# cp932-utf8.sh folder_name file_extension
# all files with the target extension under the folder will be changed
