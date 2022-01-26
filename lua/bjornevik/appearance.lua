vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true

-- vim.cmd[[colorscheme tokyonight]]
vim.cmd[[colorscheme kanagawa]]

require('kanagawa').setup {
  overrides = {
    Visual = {
      bg = require('kanagawa.colors').sakuraPink,
      fg = require('kanagawa.colors').bg,
    }
  }
}

-- LUALINE
require'lualine'.setup {
  options = {
    theme = 'tokyonight'
    },
  sections = {
    lualine_a = {
      "mode"
    },
    lualine_b = {
      {
        "branch",
        icon = ""
      },
      "diff"
    },
    lualine_c = {
      "diagnostics",
      "lsp_progress",
    },
    lualine_x = {
      "encoding",
      "filename",
      "filetype"
    },
    lualine_y = {
        "progress",
    },
    lualine_z = {
      {
        "location",
        icon = "",
      },
    },
  },
}

-- BUFFERLINE
require("bufferline").setup{}

-- NVIM-COLORIZER
require("colorizer").setup()
