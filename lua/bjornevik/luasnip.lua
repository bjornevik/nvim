local ls = require "luasnip"
local types = require "luasnip.util.types"

require("luasnip/loaders/from_vscode").lazy_load() -- opts can be ommited

-- Expand the current item or jump to the next item within the snippet
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- This always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- Selecting within a list of options
vim.keymap.set({ "i", "s" }, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- shortcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/bjornevik/luasnip.lua<CR>")

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  },
}

-- Snippet creator: s(<trigger>, <nodes>)
local s = ls.s
-- Format node: fmt(<fmt_string>, {..nodes})
local fmt = require("luasnip.extras.fmt").fmt
-- Insert node: i(<position>, [default_text])
local i = ls.insert_node
-- Repeat a node: rep(<position>)
local rep = require("luasnip.extras").rep

ls.snippets = {
  lua = {
    -- Lua specific snippets go here
    s("rq", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
  },
}
