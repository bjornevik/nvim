local has_jvim, jvim = pcall(require, "jvim")
if not has_jvim then
  return
end

vim.keymap.set("n", "<up>", jvim.prev_sibling, { noremap = true })
vim.keymap.set("n", "<down>", jvim.next_sibling, { noremap = true })
vim.keymap.set("n", "<left>", jvim.to_parent, { noremap = true })
vim.keymap.set("n", "<right>", jvim.descend, { noremap = true })
