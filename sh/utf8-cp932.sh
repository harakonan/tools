# !bin/bash
# brew install nkf

# change encoding of files with a designated extension
# from UTF8 to CP932
find $1 -name "*.$2" -type f | xargs -n 100 nkf -s --overwrite

# usage
# utf8-cp932.sh folder_name file_extension
# all files with the target extension under the folder will be changed
