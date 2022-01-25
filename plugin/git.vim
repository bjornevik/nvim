" Mapping
nmap <leader>gs :G<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gg :GitGutterToggle<CR>

" GitGutter Styling
let g:gitgutter_override_sign_column_highlight = 0
set signcolumn=yes
highlight clear SignColumn
highlight GitGutterAdd guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
highlight GitGutterChangeDelete guifg=#2B5B77 ctermfg=4
let g:gitgutter_sign_priority=0
