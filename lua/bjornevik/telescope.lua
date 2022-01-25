local actions = require("telescope.actions")
local fb_actions = require"telescope".extensions.file_browser.actions

require("telescope").setup({
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    file_ignore_patterns = {".DS_Store","flipper/.*", "gcloud/.*", "gopass/.*",
      "iterm2/.*", "plugged/.*", "undodir/.*", "*/frontend-ui-tests/.*",
      "node_modules/.*", "coc/.*", "automatic_backups/.*", "build/.*", "android/.*",
      "ios/.*", "Google/.*", "google%-chrome/.*", "pulse/.*", "evolution/.*", "menus/.*",
      ".git/.*", ".dart_tool/.*"
    },
    prompt_prefix = " > ",
    color_devicons = true,

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
        -- ["<Esc>"] = actions.close,
      },
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<C-r>"] = "delete_buffer"
        }
      }
    }
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

local M = {}
M.search_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = "< VimRC >",
    cwd = "~/.config/nvim",
    hidden = true,
  })
end

return M
