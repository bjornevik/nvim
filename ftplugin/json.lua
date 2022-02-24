vim.keymap.set("n", "<up>", require("jvim").prev_sibling, { noremap = true })
vim.keymap.set("n", "<down>", require("jvim").next_sibling, { noremap = true })
vim.keymap.set("n", "<left>", require("jvim").to_parent, { noremap = true })
vim.keymap.set("n", "<right>", require("jvim").descend, { noremap = true })
