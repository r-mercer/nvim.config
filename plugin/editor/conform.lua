vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

require('conform').setup {
  lsp_format = 'fallback',
  formatters_by_ft = {
    javascript = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    json = { 'prettierd' },
    lua = { 'stylua' },
    rust = { 'rustfmt' },
    typescript = { 'prettierd' },
    typescriptreact = { 'prettierd' },
  },
}
