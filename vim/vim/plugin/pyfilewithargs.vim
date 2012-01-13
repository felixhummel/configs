" Vim plugin for starting python scripts with arguments
" Last Change:	2009-01-19
" Maintainer:	Felix Hummel <vim@felixhummel.de>
" This work is licensed under the Creative Commons Attribution-Share Alike 3.0 Germany License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/de/ or send a letter to Creative Commons, 171 Second Street, Suite 300, San Francisco, California, 94105, USA.
" Attribute work to name: Felix Hummel
" Attribute work to URL: http://felixhummel.de
if exists("loaded_pyfilewithargs")
	finish
endif
let loaded_pyfilewithargs = 1

function s:RunPyFileWithArgs(args)
	:execute ":python import sys"
	" remember previous sys.argv (appending [:] clones a list)
	:execute ":python __old_sys_argv__ = sys.argv[:]"
	" set new sys.argv according to a:args
	" sys.argv[0] is the python file
	:execute ":python sys.argv = \"".a:args."\".split(' ')"
	" execute script
	:execute ":python print 'running %s with %s'%(sys.argv[0],sys.argv[1:])"
	" restore old argv
	:execute ":python sys.argv = __old_sys_argv__"
endfunction

command -nargs=+ PyFileWithArgs :call s:RunPyFileWithArgs(<q-args>)
