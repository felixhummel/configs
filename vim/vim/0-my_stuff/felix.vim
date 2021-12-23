function felix#rg()
  let word = shellescape(expand('<cword>'))
  " let dir = expand("%:p:h")  " directory of current buffer
  let dir = '.'
  if exists("b:NERDTreeRoot")
    let word = shellescape('')  " empty word in NERDTree
    let dir = b:NERDTreeRoot.path.str()
  endif

  call fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --color=always --smart-case -- '.word.' '.dir,
  \ 1, fzf#vim#with_preview(), !0)
endfunction

command! FelixRg :call felix#rg()
