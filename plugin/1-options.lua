-- Native NVIM Options

-- Essential Config
vim.g.mapleader = ' ' -- You know what this does
vim.g.have_nerd_font = true
vim.o.switchbuf = 'usetab' -- Prefer switching between open buffers
vim.o.undofile = true

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.cmd 'filetype plugin indent on'
if vim.fn.exists 'syntax_on' ~= 1 then
  vim.cmd 'syntax enable'
end

-- User Interface Config
vim.o.breakindent = true -- No wrapped line overhand
vim.o.breakindentopt = 'list:-1' -- Add list padding
-- vim.o.colorcolumn = '+1' -- Draw col on right of max width **** Test *****
vim.o.linebreak = true -- Wrap lines at break at
vim.o.list = true -- Nice little text indicators
vim.o.number = true -- Line numbers
-- vim.o.pumheight 	= 10		-- Smaller popup menu		*** Test *
vim.o.ruler = true -- No cursor location
vim.o.showmode = false -- No mode in commandline
vim.o.signcolumn = 'yes' -- Always show
vim.o.splitbelow = true -- Horizontal splits spawn below active window
vim.o.splitkeep = 'screen' -- Reduce screen scroll when split
vim.o.splitright = true -- Vertical splits spawn right
vim.o.winborder = 'single' -- Use single border
-- vim.o.wrap		= false		-- No Wrap 		****Test***
vim.o.scrolloff = 20 -- Keeps cursor XX lines above / below end of screen

-- Editor Config
vim.o.autoindent = true -- Enable
vim.o.expandtab = true -- Tab to Space
-- vim.o.formatoptions = 'rqnl1j' -- Improve comment editing **Test**
vim.o.ignorecase = true -- Case insensitive searches
vim.o.incsearch = true -- Per character search
vim.o.infercase = true -- Guess case for completions
vim.o.shiftwidth = 2 -- 2 spaces per indentation
vim.o.smartcase = true -- Case sensitive if appropriate
vim.o.smartindent = true -- Not actually sure what this done ngl
vim.o.spelloptions = 'camel' -- Treat camelCase word parts as separate words
vim.o.tabstop = 2 -- Tabs are two spaces
vim.o.softtabstop = 2 -- Does not actually insert tabs?
vim.o.virtualedit = 'block' -- Allow going past end of line in blockwise mode

vim.o.iskeyword = '@,48-57,_,192-255,-' -- Treat dash as `word` textobject part

-- Pattern for a start of numbered list (used in `gw`). This reads as
-- "Start of list item is: at least one special character (digit, -, +, *)
-- possibly followed by punctuation (. or `)`) followed by at least one space".
-- vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

-- Misc Config
vim.o.confirm = true -- Requires confirmation if quitting without saving

-- Diagnostics Config
vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  virtual_lines = false,
  virtual_text = {
    current_line = true,
  },
  update_in_insert = false,
}
