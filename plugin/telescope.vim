lua require("bjornevik")

nnoremap <leader>fs :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files({ hidden=true })<CR>
nnoremap <leader>fo :lua require('telescope.builtin').oldfiles({ hidden=true })<CR>
nnoremap <leader>fb :lua require('telescope').extensions.file_browser.file_browser()<CR>
nnoremap <leader>bf :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap <leader>tb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vrc :lua require('bjornevik.telescope').search_dotfiles()<CR>

" Plugin specific mappings
nnoremap <leader>fl :lua require('telescope').extensions.flutter.commands()<CR>
