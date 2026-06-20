#!/bin/zsh

brew install yadm

brew install ghostty
brew install starship
brew install sheldon

brew install pay-respects || cargo install pay-respects
brew install eza
brew install zoxide
brew install tlrc
brew install fzf
brew install fd
brew install ripgrep

brew install bat
brew install git-delta
brew install atuin
brew install dust
brew install sd
brew install btop
brew install glow
brew install hyperfine

brew install yazi
brew install lazygit

# Build bat theme cache (after the Catppuccin theme is in place via yadm)
bat cache --build
