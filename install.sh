#!/usr/bin/env bash
set -euo pipefail

echo "Installing useful utilities..."
sudo apt install -y htop stow zoxide tmux eza fzf ninja-build gettext cmake curl build-essential

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

if [[ -d "$HOME/.config/tmux/plugins/tpm" ]]; then
  echo "tpm already installed, skipping..."
else
  echo "Installing tmux/tpm..."
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
fi

echo "Installing tmux plugins..."
"$HOME/.config/tmux/plugins/tpm/bin/install_plugins"

if command -v nvim >/dev/null 2>&1; then
  echo "nvim already installed, skipping..."
else
  echo "Installing nvim..."
  git clone --depth 1 https://github.com/neovim/neovim.git "$HOME/neovim"
  (cd "$HOME/neovim" && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install)
fi
