" https://github.com/editorconfig/editorconfig-vim#excluded-patterns
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" set colorcolumn only for lines exceeding the max
" This works around colorcolumn adding whitespace when copy/pasting.
let g:EditorConfig_max_line_indicator = "exceeding"
