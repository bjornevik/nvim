return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "lewis6991/impatient.nvim"

  -- Movement
  use "ggandor/lightspeed.nvim"

  -- Git
  use "tpope/vim-fugitive"
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }

  -- Utilty
  use "windwp/nvim-autopairs"
  use "wellle/targets.vim"
  use "tpope/vim-surround"
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {}
    end,
  }
  use {
    "sbdchd/neoformat",
    config = function()
      vim.keymap.set("n", "<leader>nf", ":Neoformat<CR>", { noremap = true })
    end,
  }

  -- Adds textobject for camelCase, kebab-case etc, civ, div
  use {
    "Julian/vim-textobj-variable-segment",
    requires = {
      { "kana/vim-textobj-user" },
    },
  }

  use "neovim/nvim-lspconfig"
  use { "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" }
  -- use 'dart-lang/dart-vim-plugin'
  use "simrat39/rust-tools.nvim"
  use "ray-x/lsp_signature.nvim"
  use "folke/lua-dev.nvim"
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
  use {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end,
  }

  -- Autocomplete
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lua" },
      { "saadparwaiz1/cmp_luasnip" },
      { "onsails/lspkind-nvim" },
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use { "nvim-treesitter/playground", requires = { "nvim-treesitter/nvim-treesitter" } }
  use { "nvim-treesitter/nvim-treesitter-textobjects", requires = { "nvim-treesitter/nvim-treesitter" } }
  use { "windwp/nvim-ts-autotag", requires = { "nvim-treesitter/nvim-treesitter" } }
  use { "ThePrimeagen/jvim.nvim", requires = { "nvim-treesitter/nvim-treesitter" } }
  use {
    "danymat/neogen",
    config = function()
      require("neogen").setup {}
    end,
    requires = { { "nvim-treesitter/nvim-treesitter" } },
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
    },
  }
  use { "ThePrimeagen/harpoon", requires = { { "nvim-lua/plenary.nvim" } } }

  -- Appearance
  use "marko-cerovac/material.nvim"
  use {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  }
  use "lukas-reineke/indent-blankline.nvim"
  use "stevearc/dressing.nvim"
  use "norcalli/nvim-colorizer.lua"
  use "kyazdani42/nvim-web-devicons"
  use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } }
  use { "p00f/nvim-ts-rainbow", requires = { { "nvim-treesitter/nvim-treesitter" } } }
  use {
    "kdheepak/tabline.nvim",
    requires = { { "nvim-lualine/lualine.nvim" }, { "kyazdani42/nvim-web-devicons" } },
  }
end)
