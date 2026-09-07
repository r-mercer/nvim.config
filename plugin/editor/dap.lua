vim.pack.add {
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/mfussenegger/nvim-dap-python',
  'https://github.com/igorlfs/nvim-dap-view',
  'https://github.com/mason-org/mason.nvim',
}

-- mason is used only for debug adapters (codelldb via :MasonInstall codelldb);
-- LSPs/formatters/linters are installed with brew/npm — see README.
require('mason').setup()

-- Single-window, tabbed debugger UI; opens/closes with the session
require('dap-view').setup {
  auto_toggle = true,
}

-- Rust debugging (codelldb adapter + configurations) is provided by
-- rustaceanvim; see plugin/editor/lang/rust.lua.

-- Python: debugpy hosts the adapter, the *project's* interpreter runs the code.
-- Those are deliberately two different pythons. dap-python's enrich_config
-- resolves the debuggee per session --- VIRTUAL_ENV, then CONDA_PREFIX, then the
-- first venv/.venv/env/.env directory under cwd or an attached LSP's root_dir ---
-- so this adapter, living in mason's own venv, debugs a 3.9 project fine.
--
-- `setup('uv')` is the install-free alternative: it shells out to
-- `uv run --with debugpy`, fetching debugpy per project. Kept mason for parity
-- with codelldb, and so a non-uv project debugs the same way.
--
-- Test keymaps are buffer-local, in after/ftplugin/python.lua.
local debugpy_venv = vim.fs.joinpath(vim.fn.stdpath 'data', 'mason/packages/debugpy/venv')
local bindir = vim.fn.has 'win32' == 1 and 'Scripts' or 'bin'
require('dap-python').setup(vim.fs.joinpath(debugpy_venv, bindir, 'python'))

local dap = require 'dap'
local dapview = require 'dap-view'

local nmap_leader = function(suffix, rhs, desc)
  vim.keymap.set('n', '<Leader>' .. suffix, rhs, { desc = desc })
end

nmap_leader('db', dap.toggle_breakpoint, 'Toggle Breakpoint')
nmap_leader('dc', dap.continue, 'Continue / Start')
nmap_leader('di', dap.step_into, 'Step Into')
nmap_leader('do', dap.step_over, 'Step Over')
nmap_leader('dO', dap.step_out, 'Step Out')
nmap_leader('dt', dap.terminate, 'Terminate')
nmap_leader('dv', dapview.toggle, 'Toggle Debug View')
