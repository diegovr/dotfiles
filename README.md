# dotfiles

Personal dotfiles for the tools I use day-to-day — both for professional work and personal projects. This repository serves as a development aid and, just as much, a hobby: a place to refine, experiment with, and master my editor, terminal, and shell setup.

It is a living project. As I upgrade, swap, or rediscover a tool, its configuration is updated here to match.

## Overview

| Section | Description |
| --- | --- |
| [Neovim](https://neovim.io/) | Editor configuration, plugin management, and language tooling |
| [Tmux](https://github.com/tmux/tmux/wiki) | Terminal multiplexer setup with TPM and vim-tmux-navigator |
| [Alacritty](https://alacritty.org/) | GPU-accelerated terminal emulator configuration |
| [Oh My Posh](https://ohmyposh.dev/) | Prompt themes for the shell |

## Layout

```
.
├── alacritty/        Alacritty config
├── neovim/           Neovim init, Lua modules, and plugin specs
├── oh-my-posh/       Prompt theme files
└── tmux/             tmux.conf, bootstrap script, and plugin checkout
```

## Requirements

Some configurations assume the following are installed on the host:

- A [Nerd Font](https://www.nerdfonts.com/) (Alacritty uses `MesloLGS Nerd Font Mono`)
- [Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm) at `~/.config/tmux/plugins/tpm`

## Contributing

This is a personal repository and not actively seeking contributions. Feel free to fork and adapt anything that is useful to your own setup.
