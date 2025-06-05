local dap = require "dap"
local dapui = require "dapui"
local dap_python = require "dap-python"

dapui.setup {}

-- Python setup with the nvim-python-dap
dap_python.setup "/home/kingoruovie/.local/share/nvim/mason/packages/debugpy/venv/bin/python3"

-- Need to open our dapui for deug
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Node,ts and js
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "js-debug-adapter",
    args = {
      "${port}",
    },
  },
}

for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
    },
  }
end

require("nvim-dap-virtual-text").setup {
  commented = true, -- Show virtual text alongside comment
}
