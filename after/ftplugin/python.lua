vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

-- ruff's default line-length (inherited from black). `ruff format` will not
-- split a long string or a long identifier chain, so the marker is a reminder
-- rather than a guarantee. A project's own [tool.ruff] line-length wins for
-- formatting; this only affects where the column is drawn.
vim.opt_local.textwidth = 88
vim.opt_local.colorcolumn = '+1'

-- Debug the test under the cursor, or the enclosing class. dap-python picks the
-- runner per project: pytest.ini or a [tool.pytest*] section in pyproject.toml
-- selects pytest, manage.py selects django, otherwise unittest. Plain
-- breakpoints and 'Launch file' come from the global <Leader>d maps in
-- plugin/editor/dap.lua.
--
-- Wrapped in functions so opening a Python buffer does not pull in dap.
local map = function(mode, suffix, rhs, desc)
  vim.keymap.set(mode, '<Leader>' .. suffix, rhs, { buffer = true, desc = desc })
end

map('n', 'dn', function()
  require('dap-python').test_method()
end, 'Debug Nearest Test')
map('n', 'dN', function()
  require('dap-python').test_class()
end, 'Debug Test Class')
map('x', 'ds', function()
  require('dap-python').debug_selection()
end, 'Debug Selection')
