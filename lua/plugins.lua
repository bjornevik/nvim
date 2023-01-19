local packer = require "packer"

packer.init {
  max_jobs = 8,
  git = {
    default_url_format = "git@github.com:%s",
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "lewis6991/impatient.nvim"

  -- Movement
  use { "ggandor/leap.nvim", requires = "tpope/vim-repeat" }
  use "ggandor/flit.nvim"
  use "ggandor/leap-spooky.nvim"

  -- Git
  use "TimUntersberger/neogit"
  use "sindrets/diffview.nvim"
  use "nvim-lua/plenary.nvim"
  use "lewis6991/gitsigns.nvim"

  -- Utilty
  use "windwp/nvim-autopairs"
  use "wellle/targets.vim"
  use {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup {}
    end,
  }
  use "mrjones2014/smart-splits.nvim"
  use "ThePrimeagen/refactoring.nvim"
  use "numToStr/Comment.nvim"
  use {
    "sbdchd/neoformat",
    config = function()
      vim.keymap.set("n", "<leader>nf", ":Neoformat<CR>", { noremap = true, silent = true })
    end,
  }
  use "AckslD/nvim-neoclip.lua"

  -- Adds textobject for camelCase, kebab-case etc, civ, div
  use "kana/vim-textobj-user"
  use "Julian/vim-textobj-variable-segment"

  use {
    "andrewferrier/textobj-diagnostic.nvim",
    config = function()
      require("textobj-diagnostic").setup {}
    end,
  }

  -- mason
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- lsp
  use "neovim/nvim-lspconfig"
  use "mrshmllow/document-color.nvim"
  use "ray-x/lsp_signature.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "folke/trouble.nvim"

  -- language specific plugins
  use "simrat39/rust-tools.nvim"
  use "folke/neodev.nvim"
  use "Neevash/awesome-flutter-snippets"
  use "dart-lang/dart-vim-plugin"
  use "akinsho/flutter-tools.nvim"
  use "marilari88/twoslash-queries.nvim"

  -- Autocomplete
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "onsails/lspkind-nvim"
  use "rafamadriz/friendly-snippets"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/nvim-cmp"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "nvim-treesitter/playground"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  -- use "windwp/nvim-ts-autotag"
  use "bjornevik/nvim-ts-autotag"
  use "Ckolkey/ts-node-action"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use {
    "danymat/neogen",
    config = function()
      require("neogen").setup {}
    end,
  }

  -- Telescope
  use "nvim-telescope/telescope-fzy-native.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "nvim-telescope/telescope.nvim"
  use "debugloop/telescope-undo.nvim"

  use "ThePrimeagen/harpoon"

  -- Appearance
  use {
    "folke/noice.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify",
    },
  }
  use "luisiacc/gruvbox-baby"
  use "goolord/alpha-nvim"

  use "lukas-reineke/indent-blankline.nvim"
  use "stevearc/dressing.nvim"
  use "norcalli/nvim-colorizer.lua"
  use "nvim-lualine/lualine.nvim"
  use "mrjones2014/nvim-ts-rainbow"
  use "akinsho/bufferline.nvim"

  -- DAP
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "nvim-telescope/telescope-dap.nvim"
  use "leoluz/nvim-dap-go"
  use "mfussenegger/nvim-dap"

  -- FOLDS
  use { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }
end)
