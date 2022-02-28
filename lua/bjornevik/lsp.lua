local lspconfig = require "lspconfig"

-- LSP settings
local on_attach = function(client, bufnr)
  local pop_opts = { border = "rounded", max_width = 80 }
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<CR>", { buffer = 0 })
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = 0 })
  vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = 0 })
  vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
end

require("lsp_signature").setup {
  floating_window = true,
  floating_window_above_cur_lines = true,
  doc_lines = 0,
  always_trigger = true,
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
lspconfig.gopls.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.bashls.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.pyright.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.vimls.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.vuels.setup { on_attach = on_attach, capabilities = capabilities }
lspconfig.hls.setup { on_attach = on_attach, capabilities = capabilities }
require("flutter-tools").setup { lsp = { on_attach = on_attach, capabilities = capabilities } }

require("rust-tools").setup {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
  },
}

-- lua specific setup
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
local luadev = require("lua-dev").setup {
  lspconfig = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        path = runtime_path,
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
}
require("lspconfig").sumneko_lua.setup(luadev)

-- tsserver specific setup
-- https://github.com/typescript-language-server/typescript-language-server/issues/216#issuecomment-1005272952
local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.uri, "react/index.d.ts") == nil
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = {
    ["textDocument/definition"] = function(err, result, method, ...)
      if vim.tbl_islist(result) and #result > 1 then
        local filtered_result = filter(result, filterReactDTS)
        return vim.lsp.handlers["textDocument/definition"](err, filtered_result, method, ...)
      end

      vim.lsp.handlers["textDocument/definition"](err, result, method, ...)
    end,
  },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  signs = {
    severity_limit = "Error",
  },
  virtual_text = {
    severity_limit = "Warning",
    spacing = 2,
    prefix = "",
  },
  update_in_insert = true,
})

local function lspSymbol(name, icon)
  vim.fn.sign_define(
    "DiagnosticSign" .. name,
    { text = icon, texthl = "DiagnosticSign" .. name, numhl = "DiagnosticDefault" .. name }
  )
end
lspSymbol("Error", " ")
lspSymbol("Warning", " ")
lspSymbol("Hint", " ")
lspSymbol("Information", " ")
lspSymbol("Info", " ")

-- Folke/Trouble.nvim
vim.keymap.set("n", "<C-q>", ":TroubleToggle quickfix<CR>", { noremap = true })

vim.keymap.set("n", "<leader>q", ":TroubleToggle document_diagnostics<CR>", { noremap = true })

vim.keymap.set("n", "<C-j>", function()
  require("trouble").next { skip_groups = true, jump = true }
end, { noremap = true })

vim.keymap.set("n", "<C-k>", function()
  require("trouble").previous { skip_groups = true, jump = true }
end, { noremap = true })
