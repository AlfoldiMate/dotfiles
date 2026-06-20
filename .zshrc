# ── PATH (early so later tools resolve) ──
# ~/.cargo/bin is required: pay-respects is installed there (cargo, no brew formula).
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
fpath+=~/.zfunc

# ── ENV ──
export EZA_CONFIG_DIR=~/.config/eza/
export EDITOR="nvim"

# ── History ──
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS HIST_VERIFY EXTENDED_HISTORY
setopt AUTO_CD INTERACTIVE_COMMENTS

# ── Completion (cached compinit; MUST precede fzf-tab via sheldon below) ──
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit          # dump older than 24h (or first run): full rebuild
else
  compinit -C       # fresh dump: skip security check, faster
fi

# fzf-tab / completion styling
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# ── Plugins (sheldon; non-critical ones deferred for instant prompt) ──
eval "$(sheldon source)"

# history-substring-search keybinds — deferred so the widget exists first (↑/↓)
zsh-defer -c 'bindkey "^[[A" history-substring-search-up'
zsh-defer -c 'bindkey "^[[B" history-substring-search-down'

# ── Aliases ──
alias reload-zsh="source ~/.zshrc"
alias edit-zsh="lazyvim ~/.zshrc"
alias ls="eza --icons=always --sort=type --across"

# ── zoxide (cd replacement) ──
eval "$(zoxide init zsh --cmd cd)"

# ── pay-respects (thefuck replacement; alias: fuck) ──
eval "$(pay-respects zsh --alias fuck)"

# ── fzf ──
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"

# ── Helpers ──
cheat() {
    curl cheat.sh/$1\?T | nvim
}
title() {
  echo -n -e "\033]0;$1\007"
}

# ── Prompt (keep last) ──
eval "$(starship init zsh)"

# ── bun ──
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
