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
    "astro",
    "bash",
    "css",
    "comment",
    "dart",
    "dockerfile",
    "go",
    "gomod",
    "gowork",
    "graphql",
    "help",
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
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
}

local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.js = "typescript"
ft_to_parser.jsx = "tsx"

require("neogen").setup {
  enabled = true,
}

vim.keymap.set("n", "<leader>ng", require("neogen").generate, { noremap = true })
