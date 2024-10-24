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
  let cmd = g:FelixClipCommand
  try
    let @c = system(g:FelixClipCommand)
    if v:shell_error != 0
      " echo 'v:shell_error:' v:shell_error
      call s:handle_clipboard_error()
    else
      " begin *on* the current line if it is empty, else append
      if getline('.') =~ '^$'
        execute 'put! c'
      else
        execute 'put c'
      endif
    endif
  catch
    call s:handle_clipboard_error()
  endtry
endfunction
