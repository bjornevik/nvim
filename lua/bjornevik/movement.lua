require("lightspeed").setup {
  ignore_case = false,
  jump_to_unique_chars = true,
  exit_after_idle_msecs = { labeled = nil, unlabeled = 1000 },
  repeat_ft_with_target_char = true,
}

local smart_splits, _ = pcall(require, "smart-splits")
if smart_splits then
  -- resize splits
  vim.keymap.set("n", "<C-M-H>", require("smart-splits").resize_left)
  vim.keymap.set("n", "<C-M-J>", require("smart-splits").resize_down)
  vim.keymap.set("n", "<C-M-K>", require("smart-splits").resize_up)
  vim.keymap.set("n", "<C-M-L>", require("smart-splits").resize_right)

  -- moving between splits
  vim.keymap.set("n", "<M-H>", require("smart-splits").move_cursor_left)
  vim.keymap.set("n", "<M-J>", require("smart-splits").move_cursor_down)
  vim.keymap.set("n", "<M-K>", require("smart-splits").move_cursor_up)
  vim.keymap.set("n", "<M-L>", require("smart-splits").move_cursor_right)
end
