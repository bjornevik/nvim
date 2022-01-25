lua require("bjornevik")
set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" remap
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gbi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
inoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

nnoremap <silent> gr <cmd>TroubleToggle lsp_references<CR>
nnoremap <silent> <C-q> <cmd>TroubleToggle quickfix<CR>
nnoremap <silent> <leader>q <cmd>TroubleToggle document_diagnostics<CR>
nnoremap <silent> <C-j> <cmd>lua require("trouble").next({skip_groups = true, jump = true})<CR>
nnoremap <silent> <C-k> <cmd>lua require("trouble").previous({skip_groups = true, jump = true})<CR>

nnoremap <silent> <leader>a <cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor()) <CR>

augroup BJORNEVIK_LSP
  autocmd!
  autocmd! CursorHold * lua vim.diagnostic.open_float(0, {scope="cursor", focusable=false, border='rounded'})
  " autocmd! CursorHold * lua vim.diagnostic.open_float(0, {scope="line", focusable=false, border='rounded'})

  autocmd BufWritePre * undojoin | Neoformat
augroup END
