" paste
map <C-p> :set paste<CR>:r !qdbus org.kde.klipper /klipper org.kde.klipper.klipper.getClipboardContents<CR>:set nopaste<CR>
