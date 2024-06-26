" move lines with alt+up/down
map <M-Up> :m.-2<CR>
map <M-Down> :m.+1<CR>
" remove search highlight on enter in normal mode
nnoremap <CR> :nohlsearch<CR><CR>

" Yank to system clipboard with Ctrl+Y
vnoremap  "+y
" Paste from system clipboard
map <C-p> :call FelixClip()<CR>

" jump between errors (see :h quickfix)
nmap <M-LEFT> :cprev<cr>
nmap <M-RIGHT> :cnext<cr>

" use C-Space for omnicompletion
inoremap <Nul> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" comment leader style
map <Leader>c :Commentary<CR>
" comment pycharm style
" to get key sequence: in insert mode type <C-v><C-/>
" https://stackoverflow.com/a/9051932
map  :Commentary<CR>

" goto file, create if not exists
nnoremap gF :e <cfile><CR>
" same in vsplit
nnoremap \g :vnew <cfile><CR>
" same in split
nnoremap gs :split <cfile><CR>

" read path under cursor into buffer
:nnoremap <leader>r :read <C-r><C-f><Enter>
" grep word under cursor
:nnoremap <leader>rg :Rg <C-r><C-w><Enter>
" run ripgrep
:nnoremap <leader>? :Rg<Enter>

" Alt+. to insert argument of previous line
:inoremap . <Esc>k$vByj$pa

map <F10> :NERDTreeFind<CR>

" fzf
imap <c-x><c-k> <plug>(fzf-complete-word)
" bash history completion
" The "--text" flag lets rg continue even if a NUL byte is found
inoremap <expr> <c-x><c-h> fzf#vim#complete({ 'source': 'rg --text -v ^# ~/.bash_history', 'options': '--multi --tac --no-sort --exact', 'reducer': { lines -> join(lines, "\n") }})

" run the curent line in the shell
nmap <leader><Return> :exec '!'.getline('.')<CR>

nmap <C-f> :FelixRg<CR>
map <F5> :make<CR>

