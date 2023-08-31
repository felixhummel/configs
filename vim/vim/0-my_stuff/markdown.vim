" https://www.python.org/dev/peps/pep-0008/#maximum-line-length
" au BufRead,BufNewFile *.md setlocal textwidth=79

" surround code block, e.g. Vjj\`
vmap <leader>` c```<CR>```<ESC>P
" surround inline selection, e.g. vlll`
vmap ` S`

" comment for myst parser
" https://myst-parser.readthedocs.io/en/latest/syntax/syntax.html#comments
au FileType markdown setlocal commentstring=\%\ %s
