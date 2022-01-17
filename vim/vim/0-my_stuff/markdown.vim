" https://www.python.org/dev/peps/pep-0008/#maximum-line-length
au BufRead,BufNewFile *.md setlocal textwidth=79

" surround code block, e.g. Vjj\`
let g:surround_{char2nr('`')} = "```\r```"
vmap <leader>` S`

" TODO
" Insert Link for Selection
" visual, <leader>l to insert link
" uses visual selection as link text, jumps to the bottom, inserts link prefix
" and goes to insert mode, e.g
"   <VISUAL_START>foobar<VISUAL_END>
" results in
" [foobar][]
" ... more text until end of document
" [foobar]: <CURSOR>
