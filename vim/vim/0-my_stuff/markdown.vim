" https://www.python.org/dev/peps/pep-0008/#maximum-line-length
au BufRead,BufNewFile *.md setlocal textwidth=79

" surround code block, e.g. Vjj\`
let g:surround_{char2nr('`')} = "```\r```"
vmap <leader>` S`

" comment for myst parser
" https://myst-parser.readthedocs.io/en/latest/syntax/syntax.html#comments
au FileType markdown setlocal commentstring=\%\ %s
