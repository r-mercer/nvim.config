vim.pack.add {
  'https://github.com/mfussenegger/nvim-lint',
}

require('lint').linters_by_ft = {
  -- markdown = { 'vale' },
  javascript = { 'eslint' },
  javascriptreact = { 'eslint' },
  lua = { 'luacheck' },
  typescript = { 'eslint' },
  typescriptreact = { 'eslint' },
}
