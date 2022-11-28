-- require("leap").add_default_mappings() -- true argument for overwriting existing mappings
vim.keymap.set("n", "s", "<Plug>(leap-forward)", { noremap = true })
vim.keymap.set("n", "S", "<Plug>(leap-backward)", { noremap = true })
vim.keymap.set("x", "s", "<Plug>(leap-forward)", { noremap = true })
vim.keymap.set("x", "gs", "<Plug>(leap-backward)", { noremap = true })
vim.keymap.set("x", "x", "<Plug>(leap-forward-x)", { noremap = true })
vim.keymap.set("x", "X", "<Plug>(leap-backward-x)", { noremap = true })
vim.keymap.set("n", "gS", "<Plug>(leap-forward-cross-window)", { noremap = true })
vim.keymap.set("x", "gS", "<Plug>(leap-forward-cross-window)", { noremap = true })
vim.keymap.set("o", "gS", "<Plug>(leap-forward-cross-window)", { noremap = true })

require("flit").setup {}

local smart_splits, _ = pcall(require, "smart-splits")
if smart_splits then
  -- resize splits
  vim.keymap.set("n", "<M-Left>", require("smart-splits").resize_left)
  vim.keymap.set("n", "<M-Down>", require("smart-splits").resize_down)
  vim.keymap.set("n", "<M-Up>", require("smart-splits").resize_up)
  vim.keymap.set("n", "<M-Right>", require("smart-splits").resize_right)

  -- moving between splits
  vim.keymap.set("n", "<C-Left>", require("smart-splits").move_cursor_left)
  vim.keymap.set("n", "<C-Down>", require("smart-splits").move_cursor_down)
  vim.keymap.set("n", "<C-Up>", require("smart-splits").move_cursor_up)
  vim.keymap.set("n", "<C-Right>", require("smart-splits").move_cursor_right)
end
