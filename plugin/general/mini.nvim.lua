vim.pack.add {
  'https://github.com/nvim-mini/mini.nvim', -- also provides below headings
}

-- Text editing
require('mini.ai').setup { n_lines = 500 }
require('mini.pairs').setup()
require('mini.surround').setup()

-- General workflow
local miniclue = require 'mini.clue'
miniclue.setup {
  clues = {
    -- This is defined in 'plugin/20_keymaps.lua' with Leader group descriptions
    Config.leader_group_clues,
    miniclue.gen_clues.square_brackets(),
    { mode = 'n', keys = '[[', desc = 'Copilot previous suggestion' },
    { mode = 'n', keys = ']]', desc = 'Copilot next suggestion' },
    { mode = 'n', keys = 'gr', desc = 'Copilot refresh suggestion' },
    { mode = 'n', keys = '<C-w><C-r>', desc = 'Enter Resize Mode' },
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    -- This creates a submode for window resize mappings. Try the following:
    -- - Press `<C-w>s` to make a window split.
    -- - Press `<C-w>+` to increase height. Clue window still shows clues as if
    --   `<C-w>` is pressed again. Keep pressing just `+` to increase height.
    --   Try pressing `-` to decrease height.
    -- - Stop submode either by `<Esc>` or by any key that is not in submode.
    miniclue.gen_clues.windows {
      submode_move = true,
      submode_navigate = true,
      submode_resize = true,
    },
    miniclue.gen_clues.z(),
  },
  -- Explicitly opt-in for set of common keys to trigger clue window
  triggers = {
    { mode = 'n', keys = '<Leader>' }, -- Leader triggers
    { mode = 'x', keys = '<Leader>' },
    -- { mode = 'n', keys = '\\' },       -- mini.basics
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },
    { mode = 'i', keys = '<C-x>' }, -- Built-in completion
    { mode = 'n', keys = 'g' }, -- `g` key
    { mode = 'x', keys = 'g' },
    { mode = 'n', keys = "'" }, -- Marks
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },
    { mode = 'n', keys = '"' }, -- Registers
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },
    { mode = 'n', keys = '<C-w>' }, -- Window commands
    { mode = 'n', keys = 'z' }, -- `z` key
    { mode = 'x', keys = 'z' },
  },
}

require('mini.diff').setup()
require('mini.extra').setup()
require('mini.files').setup {
  windows = { preview = true },
  content = {
    -- Predicate for which file system entries to show
    filter = function(fs_entry)
      return not vim.startswith(fs_entry.name, '.')
    end,
    prefix = nil,
    sort = nil,
  },
}

-- Make new window and set it as target
local map_split = function(buf_id, lhs, direction)
  local rhs = function()
    local cur_target = MiniFiles.get_explorer_state().target_window
    local new_target = vim.api.nvim_win_call(cur_target, function()
      vim.cmd(direction .. ' split')
      return vim.api.nvim_get_current_win()
    end)
    MiniFiles.set_target_window(new_target)
  end

  -- Adding `desc` will result into `show_help` entries
  local desc = 'Split ' .. direction
  vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local buf_id = args.data.buf_id
    map_split(buf_id, '<C-S>', 'belowright horizontal')
    map_split(buf_id, '<C-s>', 'belowright vertical')
    MiniClue.ensure_buf_triggers(buf_id)
  end,
})

-- Auto Command to Show / Hide Dot Files
local show_dotfiles = false

local filter_show = function()
  return true
end

local filter_hide = function(fs_entry)
  return not vim.startswith(fs_entry.name, '.')
end

local toggle_dotfiles = function()
  show_dotfiles = not show_dotfiles
  local new_filter = show_dotfiles and filter_show or filter_hide
  MiniFiles.refresh { content = { filter = new_filter } }
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local buf_id = args.data.buf_id
    vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id, desc = 'Toggle DotFiles' })
    MiniClue.ensure_buf_triggers(buf_id)
  end,
})

vim.keymap.set('n', '\\', function()
  local MiniFiles = require 'mini.files'
  local _ = MiniFiles.close() or MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  vim.defer_fn(function()
    MiniFiles.reveal_cwd()
  end, 30)
end, { desc = 'Toggle MiniFiles in CWD' })

require('mini.git').setup()

-- Simple and easy statusline.
--  You could remove this setup call if you don't like it,
--  and try some other statusline plugin
local statusline = require 'mini.statusline'
statusline.setup { use_icons = vim.g.have_nerd_font }

-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
-- ---@diagnostic disable-next-line: duplicate-set-field
-- statusline.section_location = function()
--   return '%2l/%L:%-2v'
-- end
--
-- end,
-- init = function()
--   package.preload['nvim-web-devicons'] = function()
--     require('mini.icons').mock_nvim_web_devicons()
--     return package.loaded['nvim-web-devicons']
--   end
-- end,

-- Appearance
require('mini.colors').setup()
require('mini.icons').setup { mock_nvim_web_devicons = true }
require('mini.notify').setup()
require('mini.starter').setup()
require('mini.statusline').setup()
require('mini.tabline').setup()
