vim.pack.add {
  'https://github.com/mfussenegger/nvim-lint',
}

local lint = require 'lint'

lint.linters_by_ft = {
  -- markdown = { 'vale' },
  javascript = { 'eslint' },
  javascriptreact = { 'eslint' },
  lua = { 'luacheck' },
  typescript = { 'eslint' },
  typescriptreact = { 'eslint' },
}

lint.linters.luacheck = {
  name = 'luacheck',
  cmd = 'luacheck',
  stdin = true,
  args = {
    '--globals',
    'vim',
    'lvim',
    'reload',
    '--',
  },
  stream = 'stdout',
  ignore_exitcode = true,
  parser = require('lint.parser').from_errorformat('%f:%l:%c: %m', {
    source = 'luacheck',
  }),
}
