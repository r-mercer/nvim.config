vim.pack.add {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter'},
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects'},
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context'},
}

require('nvim-treesitter').setup {
  auto_install = true,
  ensure_installed = {
    'c',
    'c_sharp',
    'diff',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'rust',
    'sql',
    'toml',
    'vim',
    'yaml',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'markdown' },
  },
  sync_install = true,
  ignore_install = {},
  modules = {},
}
