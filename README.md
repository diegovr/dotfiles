# dotfiles

My personal configuration files for the tools I use every day — both for work and personal projects. This repository doubles as a development aid and a hobby: I tweak and refine these setups as I learn new ways to get the most out of my editor, terminal, and shell.

It is a living project. As I upgrade, swap, or rediscover a tool, its configuration is updated here to match.

## Contents

- **[Neovim](https://neovim.io/)** — editor configuration, plugin management, and language tooling
- **[Tmux](https://github.com/tmux/tmux/wiki)** — terminal multiplexer setup with TPM and vim-tmux-navigator
- **[Alacritty](https://alacritty.org/)** — terminal emulator configuration
- **[Oh My Posh](https://ohmyposh.dev/)** — prompt themes for the shell

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
