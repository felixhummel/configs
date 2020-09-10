" http://thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
function! FelixSpell()
  setlocal spell
  nnoremap <F5> zg
  nnoremap <F9> [s
  nnoremap <F10> ]s
endfunction
command FelixSpell :call FelixSpell()
