" https://www.python.org/dev/peps/pep-0008/#maximum-line-length
au BufRead,BufNewFile *.md setlocal textwidth=79

" surround code block, e.g. Vjj\`
let g:surround_{char2nr('`')} = "```\r```"
vmap <leader>` S`
