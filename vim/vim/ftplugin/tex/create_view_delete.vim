map <F5> :w<bar>!pdflatex %<CR>
map <F6> :!x=`basename % .tex`; okular $x.pdf &<CR>
map <F8> :!x=`basename % .tex`; rm $x.log $x.aux<CR>
