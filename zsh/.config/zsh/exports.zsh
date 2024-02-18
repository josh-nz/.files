# Not sure how safe these are to set on MacOS
# set xdg paths
# export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_DATA_HOME="$HOME/.local/share"

export EDITOR="nvim"

# Following two exports are needed to get colour results from the ls command
export CLICOLOR=1
# for light background
#export LSCOLORS=ExFxCxDxBxegedabagacad
# for dark background
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Adjust path for Homebrew usage
export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
export HOMEBREW_NO_ANALYTICS=1

# Add local script path at the front
export PATH="$HOME/bin:$PATH"

# Set default location for stow packages
#export STOW_DIR="$HOME/dotfiles"

# Add nodejs bin path at end
#export PATH="$PATH:/usr/local/share/npm/bin"

# To get shell history in iex
export ERL_AFLAGS="-kernel shell_history enabled"

# Set starship prompt theme
export STARSHIP_CONFIG="$HOME/.config/starship/gruvbox-rainbow.toml"