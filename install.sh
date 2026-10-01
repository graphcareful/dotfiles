#!/usr/bin/env bash
set -euo pipefail

echo "Installing useful utilities..."
sudo apt install -y htop stow zoxide tmux eza fzf

echo "Installing my dotfiles"
(cd "$HOME/dotfiles" && stow --ignore='ghostty' --ignore='aerospace' --ignore='install.sh' .)

echo "Creating .zshenv..."

cat >"$HOME/.zshenv" <<'EOF'
export ZDOTDIR="$HOME/.config/zsh"
source "$ZDOTDIR/.zshenv"
EOF

# Pick up GOPATH/PATH from the same .zshenv zsh will use
source "$HOME/.config/zsh/.zshenv"

# Add your workspace setup below — e.g. install tools, configure shell, etc.
echo "Installing cargo + rust runtime..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo "Installing sesh project manager..."
go install github.com/joshmedeski/sesh/v2@latest
