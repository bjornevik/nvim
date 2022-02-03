vim.cmd[[colorscheme material]]

-- LUALINE
require'lualine'.setup {
  options = {
    -- theme = 'kanagawa'
    theme = 'material'
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

-- INDENT BLANKLINE
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup{
  show_first_indent_level = false,
  use_treesitter = true,
  show_current_context = true,
  space_char_blankline = " "
}
