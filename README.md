<!-- markdownlint-disable MD013 MD033 MD041 -->

<div align="center">
  <p>
    <h1>nvim-surround-wk</h1>
  </p>
  <p>
    A Neovim plugin that adds Which Key support for nvim-surround.
  </p>
</div>

nvim-surround-wk is a Neovim plugin that integrates [nvim-surround] with [which-key.nvim] to provide rich keymap visual menus and hints for adding, modifying, and deleting surroundings.

## ⚡️ Requirements

- Neovim 0.11+
- Required plugin dependencies:
  - [nvim-surround]
  - [which-key.nvim]

## 📦 Installation

Install the plugin with your preferred package manager, such as [lazy.nvim]:

```lua
{
  "gregorias/nvim-surround-wk",
  version = "*", -- Use latest release
  config = function()
    require("nvim-surround-wk").setup()
  end,
}
```

## ⚙️ Configuration

```lua
-- Default configuration
require("nvim-surround-wk").setup({
  -- Add configuration options here
})
```

## 🚀 Usage

Describe the usage of your plugin here.

[nvim-surround]: https://github.com/kylechui/nvim-surround
[which-key.nvim]: https://github.com/folke/which-key.nvim
[lazy.nvim]: https://github.com/folke/lazy.nvim
