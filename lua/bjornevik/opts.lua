vim.opt.path:append("**")
vim.opt.wildmode = { "longest", "full" }
vim.opt.wildignore:append({
	"*.pyc",
	"*_build/*",
	"**/coverage/*",
	"**/node_modules/*",
	"**/android/*",
	"**/ios/*",
	"**/.git/*",
	"**/.go/*",
})
vim.opt.errorbells = false
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.encoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("config") .. "/undodir"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.updatetime = 200
vim.opt.cmdheight = 2
vim.opt.formatoptions:remove({ "c", "r", "o" })
vim.opt.colorcolumn = "80"
vim.opt.splitright = true
vim.opt.lazyredraw = true
vim.opt.termguicolors = true
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.shortmess:append("c")
vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }
