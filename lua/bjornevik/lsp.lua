lspconfig = require'lspconfig'
require"fidget".setup{}

-- LSP settings
local on_attach = function(client, bufnr)
  local pop_opts = { border = "rounded", max_width = 80 }
  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)
  -- require"lsp_signature".on_attach()
end

require "lsp_signature".setup({
  floating_window = false,
  always_trigger = true
})

capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.gopls.setup{on_attach=on_attach, capabilities=capabilities}
lspconfig.bashls.setup{on_attach=on_attach, capabilities=capabilities}
lspconfig.pyright.setup{on_attach=on_attach, capabilities=capabilities}
lspconfig.vimls.setup{on_attach=on_attach, capabilities=capabilities}
lspconfig.vuels.setup{on_attach=on_attach, capabilities=capabilities}
lspconfig.hls.setup{on_attach=on_attach, capabilities=capabilities}
lspconfig.rust_analyzer.setup{
  on_attach=on_attach,
  capabilities=capabilities,
  cmd = { "rustup", "run", "nightly", "rust-analyzer"}
}

-- typescript / react setup cause it sucks
lspconfig.tsserver.setup{
  capabilities=capabilities,
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end,
  handlers = {
    ["textDocument/definition"] = function (_, results, params)
      if results == nil or vim.tbl_isempty(results) then
        local _ = vim.lsp.log.info() and vim.lsp.log.info(params.method, 'No location found')
        return nil
      end

      if vim.tbl_islist(results) then
        vim.lsp.util.jump_to_location(results[1])
        if #results > 1 then
          local isReactDTs = false

          for _, result in pairs(results) do
            if string.match(result.uri, "react/index.d.ts") then
              isReactDTs = true
              break
            end
          end

          if not isReactDTs then
            vim.lsp.util.set_qflist(util.locations_to_items(results))
            vim.api.nvim_command("copen")
            vim.api.api.nvim_command("wincmd p")
          end
        end
      else
        vim.lsp.util.jump_to_location(results)
      end
    end
  }
}

require("flutter-tools").setup{
  widget_guides = {
    enabled = true,
  },
  lsp = {
    on_attach=on_attach,
    capabilities = capabilities,
  }
}

require("rust-tools").setup({})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  signs = {
    severity_limit = "Error",
  },
  virtual_text = {
    severity_limit = "Warning",
    spacing = 2,
    prefix = '',
  },
  update_in_insert = true,
})

local function lspSymbol(name, icon)
vim.fn.sign_define(
  'DiagnosticSign' .. name,
  { text = icon, texthl = 'DiagnosticSign' .. name, numhl = 'DiagnosticDefault' .. name }
)
end
lspSymbol('Error', ' ')
lspSymbol('Warning', ' ')
lspSymbol('Hint', ' ')
lspSymbol('Information', ' ')
lspSymbol('Info', ' ')

