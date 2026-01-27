vim.pack.add {
  {
    src = 'https://github.com/Saghen/blink.cmp',
    version = vim.version.range '1.*',
  },
  'https://github.com/rafamadriz/friendly-snippets',
  'https://github.com/Kaiser-Yang/blink-cmp-avante',
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
    default = { 'lsp', 'path', 'snippets', 'buffer', 'avante' },
    providers = {
      avante = {
        module = 'blink-cmp-avante',
        name = 'Avante',
        opts = {
          -- options for blink-cmp-avante
        },
      },
    },
  },

  signature = { enabled = true },
}
