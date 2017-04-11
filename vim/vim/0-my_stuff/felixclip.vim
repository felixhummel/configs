" The only option of this script
" This command is expected to return clipboard-contents on stdout.
let g:FelixClipCommand = 'xsel --clipboard'

" paste
function! s:handle_clipboard_error()
  if &paste
    set nopaste
    echo 'paste disabled'
  else
    set paste
    echo 'paste enabled'
  endif
endfunction

function! FelixClip()
  " try to put clipboard contents into the register C
  " on error: toggle paste
  let cmd = 'xsel --clipboard'
  if exists('g:FelixClipCommand')
    let cmd = g:FelixClipCommand
  endif
  try
    let @c = system(g:FelixClipCommand)
    if v:shell_error != 0
      " echo 'v:shell_error:' v:shell_error
      call s:handle_clipboard_error()
    else
      execute 'put c'
    endif
  catch
    call s:handle_clipboard_error()
  endtry
endfunction
map <C-p> :call FelixClip()<CR>
