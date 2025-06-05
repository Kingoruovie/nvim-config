require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local dap = require "dap"

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<F5>", function()
  dap.continue()
end)
map("n", "<F10>", function()
  dap.step_over()
end)
map("n", "<F11>", function()
  dap.step_into()
end)
map("n", "<F12>", function()
  dap.step_out()
end)
map("n", "<Leader>db", function()
  dap.toggle_breakpoint()
end)
map("n", "<Leader>dB", function()
  dap.set_breakpoint()
end)
map("n", "<Leader>lp", function()
  dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end)
map("n", "<Leader>dr", function()
  dap.repl.open()
end)
map("n", "<Leader>dl", function()
  dap.run_last()
end)
map({ "n", "v" }, "<Leader>dh", function()
  require("dap.ui.widgets").hover()
end)
map({ "n", "v" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end)
map("n", "<Leader>df", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.frames)
end)
-- map("n", "<Leader>ds", function()
--   local widgets = require "dap.ui.widgets"
--   widgets.centered_float(widgets.scopes)
-- end)
