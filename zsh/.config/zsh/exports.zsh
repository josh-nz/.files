# Not sure how safe these are to set on MacOS
# set xdg paths
# export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_DATA_HOME="$HOME/.local/share"

export EDITOR="nvim"

# Following two exports are needed to get colour results from the ls command.
# https://unix.stackexchange.com/questions/2897/clicolor-and-ls-colors-in-bash/2904#2904
export CLICOLOR=1
# for light background
#export LSCOLORS=ExFxCxDxBxegedabagacad
# for dark background
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Adjust path for Homebrew usage.
export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
export HOMEBREW_NO_ANALYTICS=1

# Add WezTerm binary for WezTerm CLI features.
# These are used to navigate between NeoVim and other WezTerm panes.
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"

# Add local script path at the front.
export PATH="$HOME/bin:$PATH"

# Set default location for stow packages.
#export STOW_DIR="$HOME/dotfiles"

# To get shell history in iex.
export ERL_AFLAGS="-kernel shell_history enabled"

# Catppuccin mocha theme for fzf
# https://github.com/catppuccin/fzf
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
# --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
# --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Eldritch theme for fzf
# https://github.com/eldritch-theme/fzf
# export FZF_DEFAULT_OPTS='--color=fg:#ebfafa,bg:#282a36,hl:#37f499 --color=fg+:#ebfafa,bg+:#212337,hl+:#37f499 --color=info:#f7c67f,prompt:#04d1f9,pointer:#7081d0 --color=marker:#7081d0,spinner:#f7c67f,header:#323449'
