-- AutoCommands
vim.api.nvim_create_augroup("bjornevik", {})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = "bjornevik",
  pattern = "*",
  callback = function()
    vim.cmd ":norm zz"
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "bjornevik",
  pattern = "*",
  callback = function()
    vim.cmd "%s/\\s\\+$//e"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = "bjornevik",
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove "o"
  end,
})

vim.api.nvim_create_autocmd("CursorHold", {
  group = "bjornevik",
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(0, { scope = "cursor", focusable = false, border = "rounded" })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "bjornevik",
  pattern = "*",
  callback = function()
    vim.cmd "try | undojoin | Neoformat | catch /E790/ | Neoformat | endtry"
  end,
})
