local has_treesitter, _ = pcall(require, "nvim-treesitter")
if not has_treesitter then
  return
end

require("nvim-treesitter.configs").setup {
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      move = {
        enable = true,
        set_jumps = true,

        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },

        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
      },
      keymaps = {
        -- You can use the capture groups defined in textobjects.vim
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
  },
  ensure_installed = {
    "bash",
    "css",
    "comment",
    "dart",
    "dockerfile",
    "go",
    "gomod",
    "gowork",
    "graphql",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "python",
    "query",
    "rust",
    "scheme",
    "scss",
    "tsx",
    "typescript",
    "vue",
    "yaml",
  },
  -- ensure_installed = "all",
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

require("Comment").setup {
  pre_hook = function(ctx)
    local U = require "Comment.utils"

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
}

local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.js = "typescript"
ft_to_parser.jsx = "tsx"

require("neogen").setup {
  enabled = true,
}

vim.keymap.set("n", "<leader>ng", require("neogen").generate, { noremap = true })

-- syntax-tree-surfer
require("syntax-tree-surfer").setup()
local opts = { noremap = true, silent = true }

-- Normal Mode Swapping:
-- Swap The Master Node relative to the cursor with it's siblings, Dot Repeatable
vim.keymap.set("n", "MU", function()
  vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
  return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "MD", function()
  vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
  return "g@l"
end, { silent = true, expr = true })

-- Swap Current Node at the Cursor with it's siblings, Dot Repeatable
vim.keymap.set("n", "md", function()
  vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot"
  return "g@l"
end, { silent = true, expr = true })
vim.keymap.set("n", "mu", function()
  vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot"
  return "g@l"
end, { silent = true, expr = true })

-- Visual Selection from Normal Mode
vim.keymap.set("n", "vx", "<cmd>STSSelectMasterNode<cr>", opts)
vim.keymap.set("n", "vn", "<cmd>STSSelectCurrentNode<cr>", opts)

-- Select Nodes in Visual Mode
vim.keymap.set("x", "<C-M-H>", "<cmd>STSSelectPrevSiblingNode<cr>", opts)
vim.keymap.set("x", "<C-M-J>", "<cmd>STSSelectChildNode<cr>", opts)
vim.keymap.set("x", "<C-M-K>", "<cmd>STSSelectParentNode<cr>", opts)
vim.keymap.set("x", "<C-M-L>", "<cmd>STSSelectNextSiblingNode<cr>", opts)

-- Swapping Nodes in Visual Mode
vim.keymap.set("x", "<C-j>", "<cmd>STSSwapNextVisual<cr>", opts)
vim.keymap.set("x", "<C-k>", "<cmd>STSSwapPrevVisual<cr>", opts)
