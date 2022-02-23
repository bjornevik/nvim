local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

require("telescope").setup({
	defaults = {
		prompt_prefix = " > ",
		color_devicons = true,
		path_display = { "truncate" },
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		winblend = 0,
		layout_config = {
			horizontal = {
				preview_width = 0.55,
				results_width = 0.8,
			},
			width = 0.87,
			height = 0.8,
			preview_cutoff = 120,
		},

		file_sorter = require("telescope.sorters").get_fuzzy_file,
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		file_ignore_patterns = {
			".DS_Store",
			"flipper/.*",
			"gcloud/.*",
			"gopass/.*",
			"iterm2/.*",
			"plugged/.*",
			"undodir/.*",
			"*/frontend-ui-tests/.*",
			"node_modules/.*",
			"coc/.*",
			"automatic_backups/.*",
			"build/.*",
			"android/.*",
			"ios/.*",
			"Google/.*",
			"google%-chrome/.*",
			"pulse/.*",
			"evolution/.*",
			"menus/.*",
			".git/.*",
			".dart_tool/.*",
		},

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	pickers = {
		buffers = {
			mappings = {
				i = {
					["<C-r>"] = "delete_buffer",
				},
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("flutter")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("refactoring")

local M = {}
M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = "~/.config/nvim",
		hidden = true,
	})
end

-- Telescope remaps
vim.api.nvim_set_keymap(
	"n",
	"<leader>ff",
	"<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>fb",
	"<cmd>lua require('telescope').extensions.file_browser.file_browser()<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap("n", "<leader>tb", "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })

vim.api.nvim_set_keymap(
	"n",
	"<leader>bf",
	"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>fo",
	"<cmd>lua require('telescope.builtin').oldfiles({ hidden = true })<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').git_files()<CR>", { noremap = true })

vim.api.nvim_set_keymap(
	"n",
	"<leader>vrc",
	"<cmd>lua require('bjornevik.telescope').search_dotfiles()<CR>",
	{ noremap = true }
)

-- Plugin specific remaps
require("refactoring").setup({})
vim.api.nvim_set_keymap(
	"v",
	"<leader>rr",
	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
	{ noremap = true }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>fl",
	"<Esc><cmd>lua require('telescope').extensions.flutter.commands()<CR>",
	{ noremap = true }
)

return M
