# Vinson's Neovim Configuration

Uses **Lazy** plugin manager

Uses **Nvim-tree** file explorer

## Neovim Version
```
NVIM v0.11.2
Build type: RelWithDebInfo
LuaJIT 2.1.1741730670
Run "nvim -V1 -v" for more info
```

## Structure

lsp/
---
Each file returns a table for lsp configurations.

Files in this directory are called by Neovim automatically

boot/
----
Configurations that must be done before other configurations:
- Mapping Leader Key
- Installing theme
- Installing Plugins

Files in this directory are called by `boot/init.lua`

options/
--------
Non Plugin Configurations
- Setting theme
- Loading keymaps
- Setting `vim.opt`s

Files in this directory are called by `options/init.lua`

plugins/
--------
Each file returns a table to install a plugin. Some plugin configurations are done here.

Files in this directory are called by lazy automatically. This directory was specified in `/boot/lazy.lua` in the call to `require("lazy").setup`.

setup/
------
Configurations for installed plugins.

Files in this directory are called by `setup/init.lua`
