# Neovim config files

I tried to make it as modular as possible so it's easy to understand and mantain.

# Quickstart

## Requirements

- **Neovim 0.7.0 or later** built with **tree-sitter 0.20.3+**
- `tar` and `curl` in your path (or alternatively `git`)
- A C compiler in your path and libstdc++ installed

## Installation

This config is able to bootstrap itself. The first time you open Neovim everything
will be installed automatically.

```shell
cd ~/.config
git clone https://github.com/eligum/nvim.git
```

Plugins will be installed at `~/.local/share/nvim/`.
