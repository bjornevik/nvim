" """""""""""""""""""
"       Remaps      "
" """""""""""""""""""
lua << EOF
vim.g.mapleader = " "
EOF

lua << EOF
-- Copies and Pastes
vim.keymap.set("n", '<leader>y', '"+y', { noremap = true })
vim.keymap.set("v", '<leader>y', '"+y', { noremap = true })
vim.keymap.set("n", '<leader>Y', '"+Y', { noremap = true })
vim.keymap.set("n", '<leader>p', '"+p', { noremap = true })
vim.keymap.set("n", '<leader>P', '"+P', { noremap = true })

-- Keep it centered
vim.keymap.set("n", 'n', 'nzzzv', { noremap = true })
vim.keymap.set("n", 'N', 'Nzzzv', { noremap = true })

-- Moving text
vim.keymap.set("v", '<M-j>', ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", '<M-k>', ":m '<-2<CR>gv=gv", { noremap = true })
vim.keymap.set("n", '<M-j>', ":m .+1<CR>==", { noremap = true })
vim.keymap.set("n", '<M-k>', ":m .-2<CR>==", { noremap = true })

-- Undo Break points
vim.keymap.set("i", ',', ",<C-g>u", { noremap = true })
vim.keymap.set("i", '.', ".<C-g>u", { noremap = true })
vim.keymap.set("i", '!', "!<C-g>u", { noremap = true })
vim.keymap.set("i", '?', "?<C-g>u", { noremap = true })

-- Increments & Decrements
vim.keymap.set("n", '+', "<C-a>", { noremap = true })
vim.keymap.set("n", '-', "<C-x>", { noremap = true })
vim.keymap.set("x", '+', "<C-a>", { noremap = true })
vim.keymap.set("x", '-', "<C-x>", { noremap = true })
vim.keymap.set("x", 'g+', "g<C-a>", { noremap = true })
vim.keymap.set("x", 'g-', "g<C-x>", { noremap = true })

-- Fast buffer switching
vim.keymap.set("n", '<Backspace>', "<C-^>", { noremap = true })

-- Execute macro over visual line selections
vim.keymap.set("x", "Q", ":'<,'>:normal @q<CR>", { noremap = true })

-- Disable Command history & EX mode
vim.keymap.set("n", 'q:', ":q", { noremap = true })
vim.keymap.set("n", 'Q', ":q", { noremap = true })
EOF

" Plugins
call plug#begin('~/.config/nvim/plugged')

" Movement
Plug 'ggandor/lightspeed.nvim'

" Git
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'

" Utilty
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'sbdchd/neoformat'

" Adds textobject for camelCase kebab-case etc, civ, div
Plug 'kana/vim-textobj-user'
Plug 'Julian/vim-textobj-variable-segment'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'akinsho/flutter-tools.nvim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'simrat39/rust-tools.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'folke/trouble.nvim'
Plug 'j-hui/fidget.nvim'
Plug 'folke/lua-dev.nvim'

" Autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'windwp/nvim-ts-autotag'
Plug 'danymat/neogen'
Plug 'ThePrimeagen/jvim.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'ThePrimeagen/harpoon'

" Appearance
Plug 'marko-cerovac/material.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kdheepak/tabline.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" Plugin Configs
lua << EOF
require("bjornevik")
require("Comment").setup()
vim.keymap.set("n", '<leader>nf', ':Neoformat<CR>', { noremap = true })
vim.keymap.set("n", '<leader>ng', require('neogen').generate, { noremap = true })
vim.keymap.set("n", '<C-q>', ':TroubleToggle quickfix<CR>', { noremap = true })
vim.keymap.set("n", '<leader>q', ':TroubleToggle document_diagnostics<CR>', { noremap = true })
vim.keymap.set("n", '<C-j>', function () require("trouble").next({ skip_groups = true, jump = true}) end, { noremap = true })
vim.keymap.set("n", '<C-k>', function () require("trouble").previous({ skip_groups = true, jump = true}) end, { noremap = true })

vim.api.nvim_create_augroup({ name = "bjornevik"})
vim.api.nvim_create_autocmd({ event = "InsertEnter", group = "bjornevik", pattern = "*", callback = function () vim.cmd(':norm zz') end })
vim.api.nvim_create_autocmd({ event = "BufWritePre", group = "bjornevik", pattern = "*", callback = function () vim.cmd('%s/\\s\\+$//e') end })
vim.api.nvim_create_autocmd({ event = "FileType",    group = "bjornevik", pattern = "*", callback = function () vim.opt_local.formatoptions:remove 'o' end })
vim.api.nvim_create_autocmd({ event = "CursorHold",  group = "bjornevik", pattern = "*", callback = function () vim.diagnostic.open_float(0, {scope = "cursor", focusable = false, border = 'rounded'}) end })
vim.api.nvim_create_autocmd({ event = "BufWritePre", group = "bjornevik", pattern = "*", callback = function () vim.cmd('try | undojoin | Neoformat | catch /E790/ | Neoformat | endtry') end })
EOF
