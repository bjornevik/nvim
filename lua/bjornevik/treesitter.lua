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
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_increamental = "grc",
      node_decremental = "grm",
    },
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
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
