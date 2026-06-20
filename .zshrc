# ── PATH (early so later tools resolve) ──
# ~/.cargo/bin is required: pay-respects is installed there (cargo, no brew formula).
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
fpath+=~/.zfunc

# ── ENV ──
export EZA_CONFIG_DIR=~/.config/eza/
export EDITOR="nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

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
alias ll="eza -l --icons=always --git --group-directories-first"
alias la="eza -la --icons=always --git --group-directories-first"
alias lt="eza --tree --level=2 --icons=always"
alias l="eza --icons=always"
alias cat='bat --paging=never'

# ── zoxide (cd replacement) ──
eval "$(zoxide init zsh --cmd cd)"

# ── pay-respects (thefuck replacement; alias: fuck) ──
eval "$(pay-respects zsh --alias fuck)"

# ── fzf ──
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:300 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --icons {} | head -200'"
export FZF_DEFAULT_OPTS=" \
--bind 'ctrl-/:toggle-preview' \
--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"
eval "$(fzf --zsh)"

# ── atuin (ctrl-r only; MUST be after fzf --zsh so atuin wins ^R) ──
eval "$(atuin init zsh --disable-up-arrow)"

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
