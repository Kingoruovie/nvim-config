require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "emmet_ls",
  "tailwindcss",
  "ts_ls",
  "pyright",
  "docker_compose_language_service",
  "dockerls",
  "jsonls",
  "postgres_lsp",
  "harper_ls",
  "bashls",
  "marksman",
  "eslint_lsp",
  "kulala_ls",
  "gopls",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
