filetype plugin on
syntax on
set path+=**

set wildmode=longest,full
set wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set wildignore+=**/.go/*

" """""""""""""""""""
"       Remaps      "
" """""""""""""""""""
let mapleader=" "

" Copies and Pastes
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

"" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv

"" Moving text
vnoremap <m-j> :m '>+1<CR>gv=gv
vnoremap <m-k> :m '<-2<CR>gv=gv
nnoremap <m-j> :m .+1<CR>==
nnoremap <m-k> :m .-2<CR>==
inoremap <m-j> <esc> :m .+1<CR>==
inoremap <m-k> <esc> :m .-2<CR>==

"" Undo Break opints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Increments & Decrements
nnoremap + <C-a>
nnoremap - <C-x>
xnoremap + <C-a>
xnoremap - <C-x>
xnoremap g+ g<C-a>
xnoremap g- g<C-x>

" Fast buffer switching
nnoremap <Backspace> <C-^>

" Execute macro over visual line selections
xnoremap Q :'<,'>:normal @q<CR>

" Disable Command history & EX mode
nnoremap q: :q
nnoremap Q :q

" Plugins
call plug#begin('~/.config/nvim/plugged')

" Movement
Plug 'ggandor/lightspeed.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

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

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'ThePrimeagen/harpoon'

" Appearance
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'rebelot/kanagawa.nvim',
Plug 'nvim-lualine/lualine.nvim'
Plug 'arkav/lualine-lsp-progress'
Plug 'akinsho/bufferline.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" Plugin Configs
lua require("bjornevik")
lua require('Comment').setup()
xmap gs <Plug>VSurround

" Autocommands
augroup JBJORNEVIK
  autocmd!
  autocmd! InsertEnter * norm zz
  autocmd! BufWritePre * %s/\s\+$//e
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup end
