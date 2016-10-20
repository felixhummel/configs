" ft-plugin for reStructured Text.
" Create headings easily
" Last Change:	2009-03-15
" Maintainer:	Felix Hummel <vim@felixhummel.de>
" This work is licensed under the Creative Commons Attribution-Share Alike 3.0 Germany License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/de/ or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
" Attribute work to name: Felix Hummel
" Attribute work to URL: http://felixhummel.de
" 
" Bugs:
"
" - creating heading on last line fails for over- and underline
" - mappings should be defined elsewhere

if !has('python')
  finish
endif

Python << EOF
import vim
levels = {1: '#',
          2: '*',
          3: '=',
          4: '-',
          5: '^',
          6: '"'}

def reverse_levels(char):
    for k,v in levels.iteritems():
        if v == char:
            return k

def is_heading_char(c):
    return c in levels.values()

def what_kind_of_heading_is_the_current_line():
    b = vim.current.buffer
    lineno, col = vim.current.window.cursor
    i = lineno - 1
    line = b[i]
    over = None
    under = None

    if i >= 1:  # is there a previous line?
        over = b[i-1]
    if i < len(b) - 1:  # is there a next line?
        under = b[i+1]
    if not under:
        return None
    if len(filter(is_heading_char, under)) == len(line):
        if over and len(filter(is_heading_char, over)) == len(line):
            return reverse_levels(over[0])
        else:
            return reverse_levels(under[0])
    return None

def f(x):
    create_or_replace_heading_on_current_line(x)

def vim_exec(unescaped_key_sequence):
    """think of ``:map KEY SEQUENCE`` and give SEQUENCE to me"""
    e = """execute 'normal %s'"""%unescaped_key_sequence
    vim.command(str(e))

def remove_underline():
    vim_exec('jddk')
def remove_underline_and_overline():
    vim_exec('kddjddk')
def underline(char):
    vim_exec('yypVr%sk'%char)
def underline_and_overline(char):
    underline(char)
    vim_exec('PVr%sj'%char)  # ugly but quick

def create_or_replace_heading_on_current_line(level):
    if len(vim.current.line) == 0 or level not in [1,2,3,4,5,6]:
        return
    x = what_kind_of_heading_is_the_current_line()
    if x in [1,2]:
        remove_underline_and_overline()
    elif x in [3,4,5,6]:
        remove_underline()
    char = levels[level]
    if level in [1,2]:
        underline_and_overline(char)
    if level in [3,4,5,6]:
        underline(char)

EOF

" TODO: default is set on line 95, refactor
"""""""""""""""""""""""""""""""""""""""""""
execute 'map <F12> :call RstModeselect()<CR>'

" select mode and call mapping function accordingly
let modes = ['1. Headings']
fun! RstModeselect()
    let num = inputlist(g:modes)
    if num == 1
        call RstMappingsHeading()
    endif
endfun

fun! RstMappingsHeading()
    " explicit is better than implicit
    map <F1> :python create_or_replace_heading_on_current_line(1)<CR>
    map <F2> :python create_or_replace_heading_on_current_line(2)<CR>
    map <F3> :python create_or_replace_heading_on_current_line(3)<CR>
    map <F4> :python create_or_replace_heading_on_current_line(4)<CR>
    map <F5> :python create_or_replace_heading_on_current_line(5)<CR>
    map <F6> :python create_or_replace_heading_on_current_line(6)<CR>
endfun
call RstMappingsHeading()
