vim.pack.add {
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}
-- Python: basedpyright for types/navigation, ruff's built-in LSP for
-- lint diagnostics + code actions (fix-all, organize imports).
vim.lsp.config('basedpyright', {
  settings = {
    basedpyright = {
      -- Ruff owns import organisation
      disableOrganizeImports = true,
      analysis = {
        -- basedpyright defaults to 'recommended', not to pyright's 'standard':
        -- every missing annotation and every inferred-unknown type becomes a
        -- warning. `def f(x): return json.dumps(x)` alone draws two. On a
        -- partly annotated codebase that volume buries the real errors.
        --
        -- This only sets a default for projects that say nothing themselves ---
        -- a repo's own [tool.basedpyright] in pyproject.toml still wins, so
        -- client projects are still checked on their own terms.
        typeCheckingMode = 'standard',
      },
    },
  },
})

-- See https://github.com/neovim/nvim-lspconfig
vim.lsp.enable {
  'clangd',
  'lua_ls',
  'basedpyright',
  'ruff',
}

-- blink.cmp registers its completion capabilities automatically on 0.11+
-- via vim.lsp.config('*'); no manual get_lsp_capabilities() merge needed.

-- Render inlay hints for any attached client that supports them (e.g.
-- roslyn's csharp|inlay_hints and typescript-tools' includeInlay* settings).
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method 'textDocument/inlayHint' then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})
