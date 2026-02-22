vim.pack.add {
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  -- { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  -- { src = 'https://github.com/yetone/avante.nvim' },
  { src = 'https://github.com/zbirenbaum/copilot.lua' },
  -- { src = 'https://github.com/zbirenbaum/copilot.lua' },
}

require('copilot').setup {
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = '[[',
      jump_next = ']]',
      accept = '<CR>',
      refresh = 'gr',
      open = '<M-CR>',
    },
    layout = {
      position = 'bottom', -- | top | left | right | bottom |
      ratio = 0.4,
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    hide_during_completion = true,
    debounce = 15,
    trigger_on_accept = true,
    keymap = {
      accept = '<A-l>',
      accept_word = false,
      accept_line = false,
      next = '<A-]>',
      prev = '<A-[>',
      dismiss = '<C-]>',
      toggle_auto_trigger = false,
    },
  },
}
-- require('avante').setup()
