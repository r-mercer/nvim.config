vim.pack.add {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context', version = 'master' }, -- Currently no main branch for this, leaving to denote default
}

require('nvim-treesitter').setup {}

-- Movement between textobjects ('main' branch: keymaps are user-defined).
-- Selection textobjects (aF/iF, ac/ic, ...) are wired through mini.ai's
-- treesitter spec in plugin/general/mini.nvim.lua.
require('nvim-treesitter-textobjects').setup {
  move = { set_jumps = true },
}

local move = require 'nvim-treesitter-textobjects.move'
local function map_move(lhs, fn, query, desc)
  vim.keymap.set({ 'n', 'x', 'o' }, lhs, function()
    move[fn](query, 'textobjects')
  end, { desc = desc })
end

map_move(']f', 'goto_next_start', '@function.outer', 'Next function start')
map_move('[f', 'goto_previous_start', '@function.outer', 'Previous function start')
map_move(']F', 'goto_next_end', '@function.outer', 'Next function end')
map_move('[F', 'goto_previous_end', '@function.outer', 'Previous function end')
map_move(']c', 'goto_next_start', '@class.outer', 'Next class start')
map_move('[c', 'goto_previous_start', '@class.outer', 'Previous class start')

-- Keep installed parsers in sync with the plugin version
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind == 'update' then
      vim.schedule(function()
        vim.cmd 'TSUpdate'
      end)
    end
  end,
})

require('nvim-treesitter').install {
  'bash',
  'c',
  'c_sharp',
  'diff',
  'dockerfile',
  'git_config',
  'git_rebase',
  'gitattributes',
  'gitcommit',
  'gitignore',
  'html',
  'ini', -- tox.ini, pytest.ini, setup.cfg, alembic.ini
  'javascript',
  'json',
  'lua',
  'markdown',
  'python',
  'regex',
  'requirements',
  'rust',
  'sql',
  'tsx',
  'typescript',
  'toml',
  'vim',
  'yaml',
}
