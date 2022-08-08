require("lightspeed").setup {
  ignore_case = false,
  jump_to_unique_chars = true,
  exit_after_idle_msecs = { labeled = nil, unlabeled = 1000 },
  repeat_ft_with_target_char = true,
}

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
