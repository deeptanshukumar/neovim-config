# Neovim Configuration

A minimal and modern Neovim configuration powered by [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager.

## ✨ Features

- **Fast & Efficient**: Utilizes lazy.nvim for optimal plugin loading
- **Beautiful Theme**: Catppuccin color scheme for a pleasant coding experience
- **Fuzzy Finding**: Telescope integration for quick file navigation and text search
- **Clean Setup**: Minimal configuration that's easy to understand and extend

## 📋 Prerequisites

Before installing this configuration, ensure you have:

- **Neovim** >= 0.8.0 (recommended: latest stable version)
- **Git** for cloning the repository and plugin management
- **ripgrep** (optional but recommended for Telescope live_grep functionality)
  ```bash
  # Ubuntu/Debian
  sudo apt install ripgrep
  
  # macOS
  brew install ripgrep
  
  # Windows (with Chocolatey)
  choco install ripgrep
  ```

## 🚀 Installation

### Backup Existing Configuration

If you have an existing Neovim configuration, back it up first:

```bash
# Backup your current config
mv ~/.config/nvim ~/.config/nvim.backup

# Backup your current data
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

### Install This Configuration

```bash
# Clone this repository to your Neovim config directory
git clone https://github.com/deeptanshukumar/neovim-config.git ~/.config/nvim

# Start Neovim (plugins will be automatically installed on first launch)
nvim
```

On the first launch, lazy.nvim will automatically:
1. Clone itself to the appropriate directory
2. Install all configured plugins
3. Set up the Catppuccin theme

## 🔌 Plugins

This configuration includes the following plugins:

| Plugin | Description |
|--------|-------------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Modern plugin manager for Neovim |
| [catppuccin](https://github.com/catppuccin/nvim) | Soothing pastel theme with excellent syntax highlighting |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Highly extendable fuzzy finder for files, buffers, and more |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua functions library (required by Telescope) |

## ⌨️ Key Mappings

### General

- **Leader Key**: `<Space>`

### Telescope

| Key | Mode | Description |
|-----|------|-------------|
| `<C-p>` | Normal | Find files in current directory |
| `<Space>fg` | Normal | Live grep - search for text across files |

## ⚙️ Configuration Overview

### Editor Settings

The configuration includes sensible defaults:

```lua
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.tabstop = 4           -- Number of spaces per tab
vim.opt.softtabstop = 4       -- Number of spaces for soft tab
vim.opt.shiftwidth = 4        -- Number of spaces for indentation
vim.g.mapleader = " "         -- Set leader key to space
```

### Color Scheme

The configuration uses the Catppuccin theme with default settings. The theme is automatically applied on startup.

## 🎨 Customization

### Adding New Plugins

To add new plugins, edit the `init.lua` file and add your plugin to the `plugins` table:

```lua
local plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- Add your new plugin here
    { "your-plugin/name" }
}
```

After adding a new plugin:
1. Save the file
2. Restart Neovim or run `:Lazy sync`

### Changing the Color Scheme

To use a different Catppuccin flavor (latte, frappe, macchiato, mocha):

```lua
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
})
```

### Adding Custom Key Mappings

Add your custom key mappings after the plugin configuration:

```lua
-- Example: Add a new key mapping
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
```

## 📁 File Structure

```
~/.config/nvim/
├── init.lua          # Main configuration file
└── lazy-lock.json    # Plugin version lockfile
```

## 🔄 Updating

### Update Plugins

To update all plugins to their latest versions:

```bash
# Inside Neovim, run:
:Lazy update
```

### Update Configuration

To get the latest changes from this repository:

```bash
cd ~/.config/nvim
git pull
```

## 🐛 Troubleshooting

### Plugins not loading

1. Ensure you're running a compatible Neovim version:
   ```bash
   nvim --version
   ```

2. Try manually syncing plugins:
   ```vim
   :Lazy sync
   ```

### Telescope live_grep not working

Install ripgrep (see Prerequisites section).

### Reset Configuration

If you encounter issues, you can reset the plugin directory:

```bash
rm -rf ~/.local/share/nvim/lazy
```

Then restart Neovim to reinstall all plugins.

## 📝 License

This configuration is free to use and modify for personal use.

## 🤝 Contributing

Feel free to fork this repository and customize it to your needs. If you have suggestions for improvements, open an issue or pull request!

## 📚 Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [lazy.nvim Documentation](https://github.com/folke/lazy.nvim)
- [Telescope Documentation](https://github.com/nvim-telescope/telescope.nvim)
- [Catppuccin Theme](https://github.com/catppuccin/nvim)

---

**Happy Coding!** 🎉
