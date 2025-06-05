local lint = require "lint"
lint.linters_by_ft = {
  python = { "ruff", "mypy" },
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  css = { "stylelint" },
  html = { "stylelint" },
  markdown = { "markdownlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
