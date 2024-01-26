set mouse=  " disable mouse

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" block cursor in insert mode
set guicursor=i:block

" override undo file (incompatible between vim and nvim)
set undodir=~/.local/share/nvim/undodir

" enable true color support
set termguicolors

" spellcheck (since neovim 0.9)
set spelllang=de_de,en_us
set spellcapcheck=

lua require('user/clipboard-image')
