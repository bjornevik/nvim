require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "tsserver",
    "eslint",
    "gopls",
    "vuels",
    "astro",
    "tailwindcss",
    "rust_analyzer",
  },
}

require "bjornevik.lsp"
require "bjornevik.dap"
