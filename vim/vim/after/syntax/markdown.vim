" Disable error highlight for underscore (`_`) in links
" https://github.com/tpope/vim-markdown/issues/21#issuecomment-986248462
hi link markdownError NONE

" Enable Spellchecking for LOG directories
" - test cwd: https://vi.stackexchange.com/a/34652
" - regex matching: https://vi.stackexchange.com/a/31086
if getcwd() =~# 'LOG' | set spell | endif
