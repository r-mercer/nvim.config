-- Editor Commands

-- local f = function()
--   vim.cmd 'setlocal formatoptions-=c formatoptions-=o'
-- end
-- vim.api.nvim_create_autocmd('FileType', { nil, f, "Proper 'formatoptions'" })
--
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    -- Use available |event-data|
    local name, kind = ev.data.spec.name, ev.data.kind
    -- Run build script after plugin's code has changed
    if name == 'blink.cmp' and (kind == 'install' or kind == 'update') then
      vim.system({ 'cargo build --release' }, { cwd = ev.data.path })
    elseif name == 'telescope-fzf-native' and (kind == 'install' or kind == 'update') then
      vim.system({ 'cmake --build build --config Release' }, { cwd = ev.data.path })
    end
  end,
})

-- I think this should stop entering comments auto
local f = function()
  vim.cmd 'setlocal formatoptions-=c formatoptions-=o'
end
_G.Config.new_autocmd('FileType', nil, f, "Proper 'formatoptions'")

-- Conform Auto Format On Save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})

-- Linting Auto Command
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint()
  end,
})

-- This turns on Treesitter highlights
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('EnableTreesitterHighlighting', { clear = true }),
  desc = 'Try to enable tree-sitter syntax highlighting',
  pattern = '*', -- run on *all* filetypes
  callback = function()
    pcall(function()
      vim.treesitter.start()
    end)
  end,
})

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'markdown',
--   callback = function()
--     vim.cmd.colorscheme 'catppuccin'
--   end,
-- })

-- Optional: Autocommand to return to default colorscheme when leaving specific filetypes
-- This is useful if you have a default colorscheme and only want specific ones for certain filetypes.
-- vim.api.nvim_create_autocmd('BufLeave', {
--   pattern = { '*.md' }, -- Adjust patterns as needed
--   callback = function()
--     -- Only set back to default if the new buffer is not one of the special filetypes
--     -- This prevents flickering if you switch between two special filetypes
--     if vim.bo.filetype ~= 'markdown' then
--       vim.cmd.colorscheme 'monokai-pro'
--     end
--   end,
-- })
