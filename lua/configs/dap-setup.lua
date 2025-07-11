local dap = require "dap"
local dapui = require "dapui"
local dap_python = require "dap-python"
local dap_go = require "dap-go"

dapui.setup {}

-- Python setup with the nvim-python-dap
dap_python.setup "/home/kingoruovie/.local/share/nvim/mason/packages/debugpy/venv/bin/python3"

-- Golang
dap_go.setup()

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
if not dap.adapters["pwa-node"] then
  require("dap").adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "node",
      -- 💀 Make sure to update this path to point to your installation
      args = {
        "/home/kingoruovie/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
        "${port}",
      },
    },
  }
end
if not dap.adapters["node"] then
  dap.adapters["node"] = function(cb, config)
    if config.type == "node" then
      config.type = "pwa-node"
    end
    local nativeAdapter = dap.adapters["pwa-node"]
    if type(nativeAdapter) == "function" then
      nativeAdapter(cb, config)
    else
      cb(nativeAdapter)
    end
  end
end

local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

local vscode = require "dap.ext.vscode"
vscode.type_to_filetypes["node"] = js_filetypes
vscode.type_to_filetypes["pwa-node"] = js_filetypes

for _, language in ipairs(js_filetypes) do
  if not dap.configurations[language] then
    dap.configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
    }
  end
end

require("nvim-dap-virtual-text").setup {
  commented = true, -- Show virtual text alongside comment
}
