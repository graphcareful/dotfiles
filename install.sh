#!/usr/bin/env bash

echo "Creating .zshenv..."

cat >"$HOME/.zshenv" <<'EOF'
export ZDOTDIR="$HOME/.config/zsh"
source "$ZDOTDIR/.zshenv"
EOF

echo "Installing useful utilities..."
sudo apt install -y htop stow zoxide tmux eza fzf

# Add your workspace setup below — e.g. install tools, configure shell, etc.
echo "Installing cargo + rust runtime..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing sesh project manager..."
go install github.com/joshmedeski/sesh/v2@latest
