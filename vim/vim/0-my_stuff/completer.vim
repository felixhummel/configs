inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" popup instead of preview to keep the screen's contents stable
let g:completor_complete_options = 'menuone,noselect,popup'

" no snippets
let g:completor_disable_ultisnips = 1
