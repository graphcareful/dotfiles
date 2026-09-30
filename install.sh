#!/usr/bin/env bash
# Runs when your workspace is created. The block below is the default behavior:
# symlink dotfiles from your folder to your home directory. Add any extra setup
# below (e.g. install tools, configure shell).
set -euo pipefail

DOTFILES_PATH="$HOME/dotfiles"

# Symlink dotfiles to home directory
find "${DOTFILES_PATH}/" -type f -path "$DOTFILES_PATH/.*" -print0 |
  while IFS= read -r -d '' df; do
    if [[ "$df" == "$DOTFILES_PATH/.config/"* && "${XDG_CONFIG_HOME:-}" == /* && "${XDG_CONFIG_HOME%/}" != "$HOME/.config" ]]; then
      link="${XDG_CONFIG_HOME%/}${df#"$DOTFILES_PATH/.config"}"
    else
      link=${df/$DOTFILES_PATH/$HOME}
    fi
    mkdir -p -- "$(dirname -- "$link")"
    ln -sfn -- "$df" "$link"
  done

# Add your workspace setup below — e.g. install tools, configure shell, etc.
sudo apt install -y htop stow zoxide
go install github.com/joshmedeski/sesh/v2@latest
