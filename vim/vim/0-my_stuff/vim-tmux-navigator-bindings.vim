let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-a><Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-a><Right> :TmuxNavigateRight<cr>
nnoremap <silent> <C-a><Up> :TmuxNavigateUp<cr>
nnoremap <silent> <C-a><Down> :TmuxNavigateDown<cr>

inoremap <silent> <C-a><Left> <ESC>:TmuxNavigateLeft<cr>i
inoremap <silent> <C-a><Right> <ESC>:TmuxNavigateRight<cr>i
inoremap <silent> <C-a><Up> <ESC>:TmuxNavigateUp<cr>i
inoremap <silent> <C-a><Down> <ESC>:TmuxNavigateDown<cr>i
