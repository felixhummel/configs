let g:terraform_align=1
let g:terraform_commentstring='# %s'

autocmd VimEnter *.tf call TerraformMappings()

function TerraformMappings()
  if exists('g:loaded_terraform')
    nnoremap L :TerraformFmt<CR>
  endif
endfunction
