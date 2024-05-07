" https://vi.stackexchange.com/a/5952
" ChatGPT for "range"
" https://chat.openai.com/share/2d6bd948-e193-470b-9061-56747d8b2521
function! StripTrailingWhitespace() range
    " Save cursor position
    let l:save = winsaveview()
    " Remove trailing whitespace for the specified range
    execute a:firstline . ',' . a:lastline . 's/\s\+$//e'
    " Move cursor to original position
    call winrestview(l:save)
    echo "Stripped trailing whitespace"
endfunction
command -range=% StripTrailingWhitespace :<line1>,<line2>call StripTrailingWhitespace()

" https://brookhong.github.io/2016/09/03/view-diff-file-side-by-side-in-vim.html
function! Vimdiff()
    let lines = getline(0, '$')
    let la = []
    let lb = []
    for line in lines
        if line[0] == '-'
            call add(la, line[1:])
        elseif line[0] == '+'
            call add(lb, line[1:])
        else
            call add(la, line)
            call add(lb, line)
        endif
    endfor
    tabnew
    set bt=nofile
    vertical new
    set bt=nofile
    call append(0, la)
    diffthis
    exe "normal \<C-W>l"
    call append(0, lb)
    diffthis
endfunction
autocmd FileType diff       nnoremap <silent> <leader>vd :call Vimdiff()<CR>
