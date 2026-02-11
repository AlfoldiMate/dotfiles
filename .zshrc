# Imports
source /usr/local/share/antigen/antigen.zsh 2> /dev/null
source /opt/Homebrew/share/antigen/antigen.zsh 2> /dev/null

# ENV
export EZA_CONFIG_DIR=~/.config/eza/
export EDITOR="nvim"

# Plugins

antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

# completion using arrow keys (based on history)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Aliases
alias reload-zsh="source ~/.zshrc"
alias edit-zsh="lazyvim ~/.zshrc"

alias ls="eza --icons=always --sort=type --across"

#  Zoxide (better cd) 
eval "$(zoxide init zsh)"
alias cd="z"

# cheat.sh
cheat() {
    curl cheat.sh/$1\?T | nvim
}

# The Fuck
eval $(thefuck --alias)

# FZF 
eval "$(fzf --zsh)"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"

# Stuff
title() {
  echo -n -e "\033]0;$1\007"
}

# Loading Starship
# Keep this at the end!
eval "$(starship init zsh)"
