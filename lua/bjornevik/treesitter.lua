-- Treesitter
require("nvim-treesitter.configs").setup({
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			move = {
				enable = true,
				set_jumps = true,

				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},

				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
			},
			keymaps = {
				-- You can use the capture groups defined in textobjects.vim
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
			},
		},
	},
	ensure_installed = "maintained",
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	playground = {
		enable = true,
		updatetime = 25,
		persist_queries = true,
	},
})

local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.js = "typescript"
ft_to_parser.jsx = "tsx"

require("neogen").setup({
	enabled = true,
})

-- TODO: Move to autocmd when nvim_set_autocmd is added
vim.api.nvim_set_keymap("n", "<up>", "<cmd>lua require('jvim').prev_sibling()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<down>", "<cmd>lua require('jvim').next_sibling()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<left>", "<cmd>lua require('jvim').to_parent()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<right>", "<cmd>lua require('jvim').descend()<CR>", { noremap = true })
