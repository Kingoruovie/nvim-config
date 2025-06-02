require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "emmet-ls", "tailwindcss", "ts_ls", "pyright", "docker_compose_language_service", "dockerls", "jsonls", "postgres_lsp", "harper_ls", "bashls", "marksman" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
