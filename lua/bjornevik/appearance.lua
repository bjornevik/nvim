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
    lualine_a = { "mode", "paste" },
    lualine_b = {
      { "branch", icon = "" },
      { "diff", color_added = {fg = "#a7c080" }, color_modified = {fg = "#ffdf1b" }, color_removed = {fg = "#ff6666" }  }
    },
    lualine_c = {
      { "diagnostics", sources = { "nvim_diagnostic" } },
      function()
        return "%="
      end,
      "filename",
      { getWords },
    },
    lualine_x = { "filetype" },
    lualine_y = {
      {
        "progress",
      },
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
