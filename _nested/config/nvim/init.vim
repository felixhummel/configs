set mouse=  " disable mouse

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" block cursor in insert mode
set guicursor=i:block

" override undo file (incompatible between vim and nvim)
set undodir=~/.local/share/nvim/undodir

