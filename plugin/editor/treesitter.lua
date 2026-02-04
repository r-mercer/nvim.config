vim.pack.add {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context', version = 'master' }, -- Currently no main branch for this, leaving to denote default
}

require('nvim-treesitter').setup {}

require('nvim-treesitter').install {
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
  'tsx',
  'typescript',
  'toml',
  'vim',
  'yaml',
}
