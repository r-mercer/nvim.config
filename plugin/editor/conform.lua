vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

require('conform').setup {
  default_format_opts = {
    lsp_format = 'fallback',
    timeout_ms = 1000,
  },
  format_on_save = {
    lsp_format = 'fallback',
    timeout_ms = 1000,
  },
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
