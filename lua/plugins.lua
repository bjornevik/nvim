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
  use "ggandor/lightspeed.nvim"

  -- Git
  use "TimUntersberger/neogit"
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
      vim.keymap.set("n", "<leader>nf", ":Neoformat<CR>", { noremap = true })
    end,
  }

  -- Adds textobject for camelCase, kebab-case etc, civ, div
  use "kana/vim-textobj-user"
  use "Julian/vim-textobj-variable-segment"

  use {
    "andrewferrier/textobj-diagnostic.nvim",
    config = function()
      require("textobj-diagnostic").setup {}
    end,
  }

  -- lsp
  use "neovim/nvim-lspconfig"
  use {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup {}
    end,
  }
  use "Neevash/awesome-flutter-snippets"
  use "dart-lang/dart-vim-plugin"
  use "akinsho/flutter-tools.nvim"
  use "mrshmllow/document-color.nvim"

  use "simrat39/rust-tools.nvim"
  use "ray-x/lsp_signature.nvim"
  use "folke/lua-dev.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "folke/trouble.nvim"
  use {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {}
    end,
  }

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
  use "nvim-treesitter/nvim-treesitter-context"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "windwp/nvim-ts-autotag"
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

  use "ThePrimeagen/harpoon"

  -- Appearance
  use "shaunsingh/nord.nvim"
  use "goolord/alpha-nvim"

  use "lukas-reineke/indent-blankline.nvim"
  use "stevearc/dressing.nvim"
  use "norcalli/nvim-colorizer.lua"
  use "nvim-lualine/lualine.nvim"
  use "p00f/nvim-ts-rainbow"
  use "akinsho/bufferline.nvim"

  -- DAP
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"
  use "nvim-telescope/telescope-dap.nvim"
  use "leoluz/nvim-dap-go"
  use "mfussenegger/nvim-dap"
end)
