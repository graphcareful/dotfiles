#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/prezto/init.zsh"
fi

# Customize to your needs...

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# Set personal aliases
alias cd="z"
alias cat=bat
alias ls="ls --color"
alias ll="eza -A --icons"
alias lld="eza -A --icons --long --git"
alias opw="cd $HOME/workspace/observability-pipelines-worker"
alias dog="cd $HOME/dd"
alias v="cd $HOME/workspace/vector"

export GITLAB_TOKEN=$(security find-generic-password -a ${USER} -s gitlab_token -w)
# source "${ZDOTDIR:-$HOME}/.zshrc.local"
fpath+=(/opt/homebrew/share/zsh/site-functions)

# bzl reuses completion suggestions for bazel binary
# compdef _bazel bzl

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi
autoload -Uz compinit; compinit

if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi

# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

source <(fzf --zsh)
