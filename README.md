# Nvim.Config

## To Do

### Things to Add:

- Vale for markdown linting

### Things to Investigate:

- Mise En Place CLI Util
- tsgo LSP once TypeScript 7.0 is GA (faster than vtsls; code actions were
  incomplete at RC)
- Astral's `ty` / Meta's `pyrefly` as basedpyright alternatives once mature

### Notes:

- Unused plugins are removed with `vim.pack.del({'name'})` — vim.pack does
  not remove them automatically when they leave the config.

## Design Goals

Design Goals as follows:

- Use Native Neovim functionality as much as possible, lsp config, vim.pack etc
- Use Mini functionality as much as possible
- From an Aesthetic point of view, I quite like NvChad so will tend in that direction

## Setup

Installation Steps
First, install nvim and all related dependancies. Suggest just using the install recipes in kickstart.nvim
Second, clone this repository into config files section.
This could be in several places:

- In Windows it is: `git clone https://github.com/EdgarAllenExile/nvim.config $HOME/AppData/Local/nvim`
- In Linux / MacOS use: `git clone https://github.com/EdgarAllenExile/nvim.config "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim`

### Dependancies

### LSPs, Formatters, Linters

| Name | Lang | Type | Command |
| -------------- | -------------- | --------------- | --------------- |
| lua-language-server | lua | LSP | `brew install lua-language-server` |
| stylua | lua | Formatter | `brew install stylua` |
| clangd | c/c++ | LSP | `brew install llvm` |
| rust-analyzer | rust | LSP | `brew install rust-analyzer` |
| rustfmt | rust | Formatter | `rustup component add rustfmt` |
| codelldb | rust | DAP | `:MasonInstall codelldb` (inside Neovim) |
| debugpy | python | DAP | `:MasonInstall debugpy` (inside Neovim) |
| roslyn-language-server | csharp | LSP | `dotnet tool install -g roslyn-language-server --prerelease` (requires the .NET SDK; see [roslyn.nvim](https://github.com/seblyng/roslyn.nvim#-installation) for the up-to-date feed) |
| basedpyright | python | LSP | `brew install basedpyright` |
| ruff | python | LSP (lint) / Formatter | `brew install ruff` |
| vtsls | javascript/typescript | LSP | `npm install -g @vtsls/language-server` |
| prettierd | javascript/typescript | Formatter | `npm install -g prettierd` |
| eslint_d | javascript/typescript | Linter | `npm install -g eslint_d` |


## Plugins

| Name | Function | Filepath |
| -------------- | -------------- | --------------- |
| `snacks.nvim` | Fuzzy finder (picker module only) | `plugin/helper/picker.lua` |
| `render-markdown.nvim` | Markdown rendering | `init.lua` |
| `monokai-pro.nvim` | Active colorscheme | `init.lua` / `plugin/general/colorscheme.lua` |
| `catppuccin/nvim` | Alternate colorscheme setup | `init.lua` / `plugin/general/colorscheme.lua` |
| `conform.nvim` | Format on save | `plugin/editor/conform.lua` |
| `nvim-dap` | Debug adapter client | `plugin/editor/dap.lua` |
| `nvim-dap-python` | Python debug adapter and test-debug helpers | `plugin/editor/dap.lua` |
| `nvim-dap-view` | Single-window debugger UI | `plugin/editor/dap.lua` |
| `mason.nvim` | Debug adapter installer (codelldb) | `plugin/editor/dap.lua` |
| `nvim-lint` | Filetype lint runner | `plugin/editor/lint.lua` |
| `nvim-lspconfig` | LSP server configuration | `plugin/editor/lsp-config.lua` |
| `nvim-treesitter` | Syntax parsing | `plugin/editor/treesitter.lua` |
| `nvim-treesitter-textobjects` | Syntax textobjects | `plugin/editor/treesitter.lua` |
| `nvim-treesitter-context` | Code context header | `plugin/editor/treesitter.lua` |
| `roslyn.nvim` | C# LSP integration | `plugin/editor/lang/csharp.lua` |
| `rustaceanvim` | Rust LSP and DAP integration | `plugin/editor/lang/rust.lua` |
| `mini.nvim` | Core editing and workflow modules | `plugin/general/mini.nvim.lua` |
| `claudecode.nvim` | Claude Code IDE integration (chat, diffs, context) | `plugin/helper/ai.lua` |
| `blink.cmp` | Completion engine | `plugin/helper/blink.lua` |
| `friendly-snippets` | Snippet collection | `plugin/helper/blink.lua` |
| `smart-splits.nvim` | Window movement and resizing | `plugin/helper/smart-splits.lua` |
| `neovim-tips` | Tip browser | `plugin/helper/tips.lua` |
| `precognition.nvim` | Motion hints | `plugin/helper/precog.lua` |
