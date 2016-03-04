" move lines with alt+up/down
map <M-Up> :m.-2<CR>
map <M-Down> :m.+1<CR>
" scroll without moving the cursor with ctrl+up/down
map <C-Down> 
map <C-Up> 

" jump between files (see :h gf)
nmap <M-LEFT> :bN<cr>
nmap <M-RIGHT> :bn<cr>

" use C-Space for omnicompletion
inoremap <Nul> <C-x><C-o>

" fix <C-Home> and <C-End> for xfce4-terminal
" http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
set <F13>=OH
map <F13> gg
set <F14>=OF
map <F14> G
