-- Colorscheme
vim.cmd.colorscheme "material"

-- LUALINE

require("lualine").setup {
  options = {
    theme = "material",
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      "mode",
    },
    lualine_b = {
      {
        "branch",
        icon = "",
      },
      "diff",
      "diagnostics",
    },
    lualine_x = {
      "encoding",
      "filename",
      "filetype",
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

-- bufferline
require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    custom_filter = function(buf_number)
      if vim.fn.bufname(buf_number) ~= "__FLUTTER_DEV_LOG__" then
        return true
      end
    end,
    separator_style = "slant",
  },
}

vim.keymap.set("n", "<M-h>", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-l>", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gb", ":BufferLinePick<CR>", { noremap = true, silent = true })

-- NVIM-COLORIZER
require("colorizer").setup()

-- INDENT BLANKLINE
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "tab:» "
vim.opt.listchars:append "trail:~"

require("indent_blankline").setup {
  enabled = false,
  show_first_indent_level = false,
  use_treesitter = true,
  show_current_context = true,
  space_char_blankline = " ",
  filetype_exclude = { "alpha" },
}

-- alpha-nvim
local alpha = require "alpha"
local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

dashboard.section.buttons.val = {
  dashboard.button("SPC f f", "  Find File", ":Telescope find_files<CR>"),
  dashboard.button("SPC f b", "  File Browser", ":Telescope file_browser<CR>"),
  dashboard.button("SPC f o", "  Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("SPC f s", "  Find String", ":Telescope live_grep<CR>"),
  dashboard.button("SPC h m", "  Harpoon", ":lua require('harpoon.ui').toggle_quick_menu()<CR>"),
  dashboard.button("SPC vrc", "  Settings", ":lua require('bjornevik.telescope').search_dotfiles()<CR>"),
}

alpha.setup(dashboard.opts)
