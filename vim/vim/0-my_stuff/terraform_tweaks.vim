let g:terraform_align=1
let g:terraform_commentstring='# %s'

autocmd VimEnter *.tf call TerraformMappings()

function TerraformMappings()
  nnoremap L :TerraformFmt<CR>
endfunction
