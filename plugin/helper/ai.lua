vim.pack.add {
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  -- { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/yetone/avante.nvim' },
  { src = 'https://github.com/zbirenbaum/copilot.lua' },
  -- { src = 'https://github.com/zbirenbaum/copilot.lua' },
}

require('copilot').setup()
require('avante').setup()
