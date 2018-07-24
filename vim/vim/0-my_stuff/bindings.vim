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

" comment leader style
map <Leader>c :Commentary<CR>
" comment pycharm style
" to get key sequence: in insert mode type <C-v><C-/>
" https://stackoverflow.com/a/9051932
map  :Commentary<CR>

" remove search highlight on enter in normal mode
nnoremap <CR> :nohlsearch<CR><CR>
