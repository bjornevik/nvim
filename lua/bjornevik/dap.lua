local has_dap, dap = pcall(require, "dap")
if not has_dap then
  return
end

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
end)
vim.keymap.set("n", "<leader>lp", function()
  dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end)

vim.keymap.set("n", "<leader>dr", dap.repl.toggle)
vim.keymap.set("n", "<F1>", dap.step_back)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.continue)

-- appearance
vim.fn.sign_define("DapBreakpoint", { text = "ß", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "ü", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "ඞ", texthl = "Error" })

require("nvim-dap-virtual-text").setup {}
local dapui = require "dapui"
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open {}
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close {}
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close {}
end

-- Language specific setup
require("dap-go").setup()

vim.keymap.set("n", "<leader>td", function()
  if vim.bo.filetype == "go" then
    require("dap-go").debug_test()
  end
  -- if vim.bo.filetype == "rust" then
  --
  -- end
  vim.notify "debug_test not configured for this language"
end)
