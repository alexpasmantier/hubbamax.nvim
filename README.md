<div align="center" style="color: #abb2bf;font-family: 'Fira Code', monospace;">

# hubbamax.nvim

[![Neovim](https://img.shields.io/badge/Neovim-0.9%2B-7e98e8.svg?style=for-the-badge&logo=neovim)](https://neovim.io/)
![Lua](https://img.shields.io/badge/Made%20with%20Lua-8faf77.svg?style=for-the-badge&logo=lua)

**A dark Neovim colorscheme based on habamax, easier on the eyes.**

<img width="1920" alt="2025-12-08-153645_hyprshot" src="https://github.com/user-attachments/assets/8ff9e2a6-e74e-43fa-bbea-49b7ac951156" />
<img width="1920" alt="2025-12-09-173150_hyprshot" src="https://github.com/user-attachments/assets/f908ec37-52de-40ec-921b-0ad91e01926f" />


</div>

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  'alexpasmantier/hubbamax.nvim',
  lazy = false,
  priority = 1000,
}
```

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
use 'alexpasmantier/hubbamax.nvim'
```

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'alexpasmantier/hubbamax.nvim'
```

## Usage

```lua
vim.cmd('colorscheme hubbamax')
```

Or in Vimscript:

```vim
colorscheme hubbamax
```

## Using this with Ghostty

To use this colorscheme with [Ghostty](https://ghostty.org/), copy `hubbamax.ghostty` to your Ghostty themes folder (usually `~/.ghostty/themes/`), and select it in your Ghostty configuration.

## License

MIT
