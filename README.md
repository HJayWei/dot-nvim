# 💤 Personal Neovim Configuration

A personalized Neovim configuration built on top of [LazyVim](https://github.com/LazyVim/LazyVim), customized for my workflow and development needs.

## 📋 Overview

This configuration extends LazyVim with custom options, keymaps, and carefully selected plugins to enhance productivity across multiple programming languages and development workflows.

## ✨ Features

### 🎨 Theme & UI

- **Color Scheme**: Catppuccin Frappé theme
- **Neovide Support**: Optimized settings for Neovide GUI including transparency, cursor effects, and clipboard integration
- **Line wrapping** enabled with visual column guide at 120 characters

### 🔧 Core Enhancements

- **Shell**: Configured to use `/bin/zsh`
- **Custom Keymaps**:
  - `Ctrl+Q`: Quick quit file
  - `Shift+Q`: Delete buffer
  - `Alt+H`/`Alt+L`: Jump to first/last non-whitespace character
  - Git diffview commands under `<leader>gd` prefix

### 📦 Additional Plugins

#### Development Tools

- **vim-dadbod-ui**: Database management interface with completion support
- **rsync.nvim**: File synchronization with remote servers (conditionally loaded if rsync is installed)
- **mason-tool-installer**: Auto-installs and manages LSP servers, formatters, and linters based on available languages

#### Git Integration

- **diffview.nvim**: Enhanced git diff viewing
- **git-conflict.nvim**: Interactive conflict resolution

#### Editor Enhancements

- **vim-visual-multi**: Multiple cursor support (`Ctrl+N` to find next)
- **mini-surround**: Efficient surround text operations
- **nvim-cmp**: Code completion

#### File Management

- **snacks_explorer**: File explorer
- **snacks_picker**: Fuzzy finder

### 🌐 Language Support

This configuration uses **dynamic language detection** to install only the tools for languages that are available in the Docker container.

#### Language Detection Mechanism

- **Marker File**: `~/.language-support` created during Docker build
- **Utility**: `lua/utils/language-support.lua` reads language availability
- **Conditional Loading**: Tools are only installed for enabled languages

#### Configured Language Servers & Tools

Tools are conditionally installed based on language availability:

- **PHP** (if enabled): Intelephense, PHP Debug Adapter, Pint
- **Rust** (if enabled): rust-analyzer, CodeLLDB
- **JavaScript/TypeScript** (if Node.js enabled): vtsls, JS Debug Adapter, Prettier, Vetur VLS (Vue)
- **Go** (if enabled): golangci-lint, gopls, delve, goimports, gofumpt, go-debug-adapter
- **Lua** (if enabled): lua-language-server, StyLua
- **Always installed**: bash-language-server, json-lsp, shellcheck, shfmt, markdown tools

#### Treesitter Parsers

Installed parsers: `c`, `lua`, `vim`, `vimdoc`, `javascript`, `typescript`, `tsx`, `json`, `html`, `css`, `bash`, `query`, `markdown`, `markdown_inline`, `blade`, `go`, `php`, `scss`, `vue`, `tmux`, `sql`, `rust`

### 🎯 Custom Treesitter Queries

- **Blade template support**: Custom syntax highlighting and injections for Laravel Blade templates

## 📚 LazyVim Extras

This configuration includes the following LazyVim extras:

- `coding.mini-surround`
- `coding.nvim-cmp`
- `editor.snacks_explorer`
- `editor.snacks_picker`
- `formatting.prettier`
- `lang.json`
- `lang.markdown`
- `lang.rust`
- `util.dot`
- `util.mini-hipatterns`

## 🚀 Installation

1. **Backup your existing Neovim configuration** (if any):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   mv ~/.local/state/nvim ~/.local/state/nvim.backup
   mv ~/.cache/nvim ~/.cache/nvim.backup
   ```

2. **Clone this repository**:

   ```bash
   git clone https://github.com/HJayWei/dot-nvim.git ~/.config/nvim
   ```

3. **Start Neovim**:

   ```bash
   nvim
   ```

   LazyVim will automatically install all plugins and dependencies on first launch.

## 📝 Configuration Structure

```
.
├── init.lua                          # Entry point
├── lua/
│   ├── config/
│   │   ├── autocmds.lua              # Auto commands
│   │   ├── keymaps.lua               # Custom keymaps
│   │   ├── lazy.lua                  # Lazy.nvim bootstrap
│   │   ├── neovide.lua               # Neovide-specific settings
│   │   └── options.lua               # Editor options
│   ├── plugins/
│   │   ├── dadbod.lua                # Database UI
│   │   ├── diffview.lua              # Git diff viewer
│   │   ├── extra-treesitter.lua      # Additional parsers
│   │   ├── git-conflict.lua          # Conflict resolution
│   │   ├── lsp.lua                   # LSP configurations
│   │   ├── mason-tool-installer.lua  # Dynamic tool installer
│   │   ├── multi-cursor.lua          # Multiple cursors
│   │   ├── rsync.lua                 # File sync (conditional)
│   │   └── theme.lua                 # Color scheme
│   └── utils/
│       ├── language-support.lua      # Language detection utility
│       └── README.md                 # Utils documentation
├── after/
│   └── queries/
│       └── blade/                    # Blade template queries
├── lazyvim.json                      # LazyVim extras configuration
└── stylua.toml                       # Lua formatter config
```

## 🔨 Customization

- **Add new plugins**: Create a new file in `lua/plugins/` directory
- **Modify keymaps**: Edit `lua/config/keymaps.lua`
- **Change options**: Edit `lua/config/options.lua`
- **Add LazyVim extras**: Run `:LazyExtras` in Neovim

## 📖 Resources

- [LazyVim Documentation](https://lazyvim.github.io/)
- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Plugin Manager](https://github.com/folke/lazy.nvim)

## 📄 License

This configuration is available under the MIT License. See [LICENSE](LICENSE) file for details.
