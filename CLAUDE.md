# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This repo stores dotfiles and setup scripts for bootstrapping new machines on Ubuntu (Linux) and macOS. It is not a software project — there are no tests, builds, or linting pipelines.

## Key Commands

```bash
make help                        # Show all available make targets
make apply-configurations        # Copy configs from repo → home directory (OS-aware)
make copy-configurations-to-git  # Copy configs from home directory → repo (strips name/email from .gitconfig)
make install-software            # Run the OS-appropriate install script
```

## Architecture

The repo has two concerns:

1. **Config files** (`configs/`) — dotfiles for zsh, bash, vim, tmux, git, prettier, asdf, and the oh-my-zsh theme. Tmux status scripts are split by OS: `configs/tmux/linux/` and `configs/tmux/macos/`. AI agent settings live in subdirectories:
   - `configs/claude/` — Claude Code `settings.json` (→ `~/.claude/`)
   - `configs/vscode/` — VS Code `settings.json` and `mcp.json` (→ `~/Library/Application Support/Code/User/`)

2. **Install/helper scripts** (`helper_scripts/`) — one install script per OS. They install packages, clone plugin managers (Vundle for vim, tpm for tmux, asdf for runtime versions, oh-my-zsh), then call `make apply-configurations` at the end.
`dmenu/` contains Linux-only scripts deployed to `~/.local/bin` and `/usr/bin/dmenu_run`.

The Makefile uses `$(shell uname -s)` to branch between `Linux` and `Darwin` for OS-specific file placements.

## Style Guide

In Markdown files, write one sentence per line.

## Workflow

- To update a config: edit the file in `configs/`, then run `make apply-configurations` on the target machine.
- To capture changes made directly on a machine: run `make copy-configurations-to-git`, then commit.
- The `.gitconfig` copy strips `name`/`email`/`user` lines via `sed` to avoid committing personal identity.
