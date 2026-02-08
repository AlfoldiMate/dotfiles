# Imports
source /usr/local/share/antigen/antigen.zsh

# Nv

export EZA_CONFIG_DIR=~/.config/eza/

# Plugins

antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

# The Fuck
eval $(thefuck --alias)

# completion using arrow keys (based on history)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Aliases
alias lazyvim='NVIM_APPNAME="nvim-lazyvim" nvim'

alias reload-zsh="source ~/.zshrc"
alias edit-zsh="lazyvim ~/.zshrc"

alias ls="eza --icons=always --sort=type --across"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"

# --- Yazi Setup ---
# export EDITOR="NVIM_APPNAME="nvim-lazyvim" nvim"
#

tabname() {
    echo -n -e "\033]0;$1\007"
}

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"

# Loading Starship
# Keep this at the end!
eval "$(starship init zsh)"
