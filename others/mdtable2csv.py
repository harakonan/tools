#!/Users/harakonan/.pyenv/shims/python
#coding:utf-8
# Created by tom_th_lin on 2015/9/18.
import sys
import io
import requests
from flask import abort, json
# from md2html import _read_file_or_404
# from md2html import render_content
from bs4 import BeautifulSoup

###
# define function
###

def _read_file_or_404(filename, read_as_text=True):
    """
    Reads the contents of the specified file, or raise 404.
    """
    mode = 'rt' if read_as_text else 'rb'
    encoding = 'utf-8' if read_as_text else None
    try:
        with io.open(filename, mode, encoding=encoding) as f:
            return f.read()
    except IOError as ex:
        if ex.errno != errno.ENOENT:
            raise
        abort(404)

def render_content(text, api_url, gfm=False, context=None,
                   username=None, password=None):
    """
    Renders the specified markup using the GitHub API.
    """
    if gfm:
        url = '{}/markdown'.format(api_url)
        data = {'text': text, 'mode': 'gfm'}
        if context:
            data['context'] = context
        data = json.dumps(data, ensure_ascii=False).encode('utf-8')
        headers = {'content-type': 'application/json; charset=UTF-8'}
    else:
        url = '{}/markdown/raw'.format(api_url)
        data = text.encode('utf-8')
        headers = {'content-type': 'text/x-markdown; charset=UTF-8'}
    auth = (username, password) if username or password else None
    r = requests.post(url, headers=headers, data=data, auth=auth)
    # Relay HTTP errors
    if r.status_code != 200:
        try:
            message = r.json()['message']
        except Exception:
            message = r.text
        abort(r.status_code, message)
    return r.text

###
#
# Start program.
# 
###
if len(sys.argv) >= 2:
    filename = sys.argv[1]
else:
    print("please put sys.argv[1] as filename !!")
    sys.exit()
if not (filename[-2:] == 'md'):
    print("the file format should be *.md")
    sys.exit()
render_text = _read_file_or_404(filename)
# print(render_text)
api_url = 'https://api.github.com'
html_table = render_content(render_text, api_url, True, None, None, None)

soup = BeautifulSoup(html_table, "html.parser") # parse html
table = soup.table # get <table>...</table>
# print(table)

f = open(filename[0:filename.find('.')] +'.csv', 'w') # open file.csv

rows = table.find_all('tr') # get all content <tr></tr>

ths = rows[0].find_all('th')

write_th_to_file = ''
for th in ths:
    if th.string is not None:
        write_th_to_file += (th.string + ',')
    else:
        write_th_to_file += (' ' + ',')
write_th_to_file = write_th_to_file[:-1]

f.write(write_th_to_file)
f.write('\n')

for row in rows[1:]:
    write_td_to_file = ''
    tds = row.find_all('td')
    for td in tds:
            if td.string is not None:
                write_td_to_file += (td.string+',')
            else:
                write_td_to_file += (' '+',')
    write_td_to_file = write_td_to_file[:-1]
    # print(write_td_to_file)
    f.write(write_td_to_file)
    f.write('\n')

f.close()
print("convertion successfully done")
