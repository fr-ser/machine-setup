# Machine Setup

This repo should contain setup scripts and configuration for the setup of new machines.

## Requirements

To run the scripts the following things need to be be present and installed already

- make (to run the Makefile commands)

## Usage

To see the available commands run: `make help`

## Content of the setup

### Supported environments

- linux (Ubuntu)
- MacOs

## Application to install

- Terminal applications:
  - Linux: zsh, curl, jq, vim, git, tmux, htop, dmenu, direnv, python build tools
  - macOs: jq, tmux, direnv
- vim related: package manager (vundle) and packages
- tmux related: tmux plugin manager and packages, powerline and powerline fonts
- zsh related: oh-my-zsh
- docker: needs to be installed manually

## App Configurations

The following apps have a configuration in this repo:

- git
- zsh
- tmux
- vim
- bash
- prettier
- asdf
- dmenu (Linux only)

### Explicitly excluded: VS Code

VS Code settings and MCP config are **not** managed by this repo.
Settings differ too much between work and personal machines to share a single config, and VS Code's built-in Settings Sync (tied to a GitHub/Microsoft account) handles per-machine synchronisation better anyway.

## Git identity setup

`configs/.gitconfig` only contains portable settings — no name, email, or machine-specific paths.
Git identity is managed per-folder via `[includeIf]` blocks and separate identity files that live only on the machine, never in this repo.

### Fresh machine setup

After running `make apply-configurations` for the first time, create the identity files manually:

**`~/.gitconfig-work`**

```ini
[user]
    name = Your Name
    email = you@work.com
```

**`~/.gitconfig-private`**

```ini
[user]
    name = Your Name
    email = you@personal.com
```

Then append the `[includeIf]` blocks to `~/.gitconfig` to activate them per folder:

```ini
[includeIf "gitdir:/path/to/work/repos/"]
    path = ~/.gitconfig-work

[includeIf "gitdir:/path/to/private/repos/"]
    path = ~/.gitconfig-private
```

Subsequent `make apply-configurations` runs will preserve any `[includeIf]` blocks already in `~/.gitconfig`, so you only need to do this once per machine.
