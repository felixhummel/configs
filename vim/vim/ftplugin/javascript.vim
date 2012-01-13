" jslint
" http://stackoverflow.com/questions/473478/vim-jslint
map <F5> :w<bar>!cat %<bar> /usr/bin/smjs $HOME/bin/mylintrun.js %<CR>
set tabstop=2
set softtabstop=2 " compatability with mix of tabs and spaces
set shiftwidth=2 " for >> and <<
