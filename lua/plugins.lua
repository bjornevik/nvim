return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "lewis6991/impatient.nvim"

  -- Movement
  use "ggandor/lightspeed.nvim"

  -- Git
  use "TimUntersberger/neogit"
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }

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
  use {
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }
  use "numToStr/Comment.nvim"
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
  use {
    "andrewferrier/textobj-diagnostic.nvim",
    config = function()
      require("textobj-diagnostic").setup {}
    end,
  }

  use "neovim/nvim-lspconfig"
  use {
    "akinsho/flutter-tools.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "Neevash/awesome-flutter-snippets" },
      { "dart-lang/dart-vim-plugin" },
    },
  }
  -- use "dart-lang/dart-vim-plugin"
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
      { "onsails/lspkind-nvim" },
      { "rafamadriz/friendly-snippets" },
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
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
  use { "JoosepAlviste/nvim-ts-context-commentstring", require = "nvim-treesitter/nvim-treesitter" }
  use { "ziontee113/syntax-tree-surfer", requires = { "nvim-treesitter/nvim-treesitter" } }

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
  use { "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" }

  -- DAP
  use {
    "mfussenegger/nvim-dap",
    requires = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
      "leoluz/nvim-dap-go",
    },
  }
end)
