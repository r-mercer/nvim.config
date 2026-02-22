vim.pack.add {
  {
    src = 'https://github.com/Saghen/blink.cmp',
    version = vim.version.range '1.*',
  },
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/giuxtaposition/blink-cmp-copilot',
  'https://github.com/L3MON4D3/LuaSnip',
}

require('blink.cmp').setup {
  preset = 'default',
  keymap = { preset = 'default' },

  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 100 },
  },

  ghost_text = { enabled = true },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
    providers = {
      copilot = {
        name = 'copilot',
        module = 'blink-cmp-copilot',
        score_offset = 100,
        async = true,
      },
    },
  },

  signature = { enabled = true },
}
