-- Copies and Pastes
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<leader>Y", '"+Y', { noremap = true })
vim.keymap.set("n", "<leader>p", '"+p', { noremap = true })
vim.keymap.set("n", "<leader>P", '"+P', { noremap = true })
vim.keymap.set("v", "<leader>p", '"+p', { noremap = true })

-- Keep it centered
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })

-- Moving text
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { noremap = true })
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", { noremap = true })
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", { noremap = true })

-- Undo Break points
vim.keymap.set("i", ",", ",<C-g>u", { noremap = true })
vim.keymap.set("i", ".", ".<C-g>u", { noremap = true })
vim.keymap.set("i", "!", "!<C-g>u", { noremap = true })
vim.keymap.set("i", "?", "?<C-g>u", { noremap = true })

-- Increments & Decrements
vim.keymap.set("n", "+", "<C-a>", { noremap = true })
vim.keymap.set("n", "-", "<C-x>", { noremap = true })
vim.keymap.set("x", "+", "<C-a>", { noremap = true })
vim.keymap.set("x", "-", "<C-x>", { noremap = true })
vim.keymap.set("x", "g+", "g<C-a>", { noremap = true })
vim.keymap.set("x", "g-", "g<C-x>", { noremap = true })

-- Fast buffer switching
vim.keymap.set("n", "<Backspace>", "<C-^>", { noremap = true })

-- Execute macro over visual line selections
vim.keymap.set("x", "Q", ":'<,'>:normal @q<CR>", { noremap = true })

-- Disable Command history & EX mode
vim.keymap.set("n", "q:", ":q", { noremap = true })
vim.keymap.set("n", "Q", ":q", { noremap = true })

-- make HJKl behave better for navigation
vim.keymap.set("n", "H", "^", { noremap = true })
vim.keymap.set("n", "J", "<C-d>", { noremap = true })
vim.keymap.set("n", "K", "<C-u>", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })
