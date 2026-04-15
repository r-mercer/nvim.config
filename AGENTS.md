# AGENTS.md

## Repo Shape
- This is a Neovim config repo.
- `init.lua` is the entrypoint.
- `plugin/` holds the main config modules, grouped by concern.
- `after/ftplugin/` and `after/lsp/` contain filetype and LSP overrides.
- `nvim-pack-lock.json` is the plugin lockfile.

## Conventions
- Prefer native Neovim APIs and small modules over adding abstractions.
- Keep changes localized to the relevant module; preserve the existing numbered load order in `plugin/` unless startup behavior must change.
- Put filetype-specific behavior in `after/` unless the change is truly global.
- Follow `.stylua.toml` for Lua formatting.

## Tooling / Behavior
- `conform.nvim` formats on save.
- The configured formatters here are `stylua`, `prettierd`, and `rustfmt`.
- LSP setup lives in `plugin/editor/lsp-config.lua`.
- `PackChanged` autocmds rebuild `blink.cmp` with Cargo and `telescope-fzf-native` with CMake after install/update.

## Before Editing
- Check `README.md` and the relevant module before changing behavior.
- If plugin availability changes, update `nvim-pack-lock.json` with the code change.
