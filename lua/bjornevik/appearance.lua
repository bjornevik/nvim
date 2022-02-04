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

-- tabline
require("tabline").setup{
  enable = true,
  options = {
    show_filename_only = true,
  }
}

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

-- GITSIGNS
require('gitsigns').setup {
  current_line_blame_formatter_opts = {
    relative_time = true
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map('n', '<leader>gb', gs.toggle_current_line_blame)
    map('n', '<leader>gd', gs.diffthis)
  end
}
