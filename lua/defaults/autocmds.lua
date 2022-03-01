-- AutoCommands
vim.api.nvim_create_augroup("bjornevik", {})

-- Centers current line vertically when entering INSERT mode
vim.api.nvim_create_autocmd("InsertEnter", {
  group = "bjornevik",
  pattern = "*",
  callback = function()
    vim.cmd ":norm zz"
  end,
})

-- Removes whitespace at the ends of lines before saving
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "bjornevik",
  pattern = "*",
  callback = function()
    vim.cmd "%s/\\s\\+$//e"
  end,
})

-- Disable automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
vim.api.nvim_create_autocmd("FileType", {
  group = "bjornevik",
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove "o"
  end,
})

-- Show diagnostic on cursor hover.
vim.api.nvim_create_autocmd("CursorHold", {
  group = "bjornevik",
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(0, { scope = "cursor", focusable = false, border = "rounded" })
  end,
})

-- Run Neoformat before save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = "bjornevik",
  pattern = "*",
  callback = function()
    vim.cmd "try | undojoin | Neoformat | catch /E790/ | Neoformat | endtry"
  end,
})
