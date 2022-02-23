vim.cmd([[colorscheme material]])

-- LUALINE
require("lualine").setup({
	options = {
		-- theme = 'kanagawa'
		theme = "material",
	},
	sections = {
		lualine_a = {
			"mode",
		},
		lualine_b = {
			{
				"branch",
				icon = "",
			},
			"diff",
		},
		lualine_c = {
			"diagnostics",
		},
		lualine_x = {
			"encoding",
			"filename",
			"filetype",
		},
		lualine_y = {
			"progress",
		},
		lualine_z = {
			{
				"location",
				icon = "",
			},
		},
	},
})

-- tabline
require("tabline").setup({
	enable = true,
	options = {
		show_filename_only = true,
	},
})

-- NVIM-COLORIZER
require("colorizer").setup()

-- INDENT BLANKLINE
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup({
	show_first_indent_level = false,
	use_treesitter = true,
	show_current_context = true,
	space_char_blankline = " ",
	filetype_exclude = { "dashboard" },
})

-- GITSIGNS
require("gitsigns").setup({
	current_line_blame_formatter_opts = {
		relative_time = true,
	},
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		map("n", "<leader>gb", gs.toggle_current_line_blame)
		map("n", "<leader>gd", gs.diffthis)
	end,
})
vim.keymap.set("n", "<leader>gs", "<cmd>G<CR>") -- fugitive.vim

-- dashboard-nvim
local g = vim.g
g.dashboard_default_executive = "telescope"
g.dashboard_custom_section = {
	a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
	b = { description = { "  File Browser              SPC f b" }, command = "Telescope file_browser" },
	c = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
	d = { description = { "  Find String               SPC f s" }, command = "Telescope live_grep" },
	e = {
		description = { "  Harpoon                   SPC h m" },
		command = "lua require('harpoon.ui').toggle_quick_menu()",
	},
	f = {
		description = { "  Nvim Config               SPC vrc" },
		command = "lua require('bjornevik.telescope').search_dotfiles()",
	},
}
g.dashboard_custom_footer = { "type :help<Enter>" }
g.dashboard_custom_header = {
	"                                   ",
	"                                   ",
	"                                   ",
	"   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
	"    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
	"          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
	"           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
	"          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
	"   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
	"  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
	" ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
	" ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
	"      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
	"       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
	"                                   ",
}
