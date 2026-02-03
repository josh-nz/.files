# ZSH files overview:
# https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where

# A ZSH guide is here:
# https://zsh.sourceforge.io/Guide/
source $ZDOTDIR/exports.zsh

HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=1000                   # How many lines to keep in memory.
SAVEHIST=$HISTSIZE              # How many lines to keep in history file.
# setopt BANG_HIST                 # Treat the '!' character specially during expansion.
# setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
# setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
# setopt HIST_BEEP                 # Beep when accessing nonexistent history.
# setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
# setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
# setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
# setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
# setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
# setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

# history-search-direction when called with a partial command, will
# only search history matching that command, and not replace the 
# existing command. For example, if you type `curl ` and trigger
# the history search, you only match results that start with `curl `.
bindkey '^[[A' history-search-backward  # Up key.
bindkey '^[[B' history-search-forward  # Down key.
bindkey '^N' history-search-forward   # Ctrl-n key.
bindkey '^P' history-search-backward   # Ctrl-p key.

bindkey '^Y' autosuggest-accept


# Basic auto/tab complete:
# https://thevaluable.dev/zsh-completion-guide-examples/
autoload -Uz compinit
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Guide section 6.5
# zstyle <context> <style> <value...>
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' menu select  # Show completions as list of choices, can navigate using tab or arrow keys.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive completion matching.
# ls --colour doesn't work on MacOS, maybe that's why the following doesn't work also. Non-GNU ls or something?
# zstyle ':completion:*' list-colors "${(s.:.)LSCOLORS}"  # Doesn't seem to use LSCOLORS values (folders and symlinks have swapped colours from `ls` output).
# zstyle ':completion:*' list-colors '' # Default colours.
compinit
_comp_options+=(globdots)   # Include hidden files in completion.

# Homebrew init
eval "$(/opt/homebrew/bin/brew shellenv)"

source $ZDOTDIR/prompt.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/functions.zsh


# Bindings might refer to functions defined in the above file.
bindkey -s '^o' 'lfcd\n'

# Use Emacs bindings. This is required for tmux to correctly process Ctrl-a and Ctrl-e
# even if ZSH works fine without the following line.
# https://stackoverflow.com/a/39520371
bindkey -e

# brew install zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# https://mise.jdx.dev/getting-started.html
eval "$(mise activate zsh)"

# https://github.com/ajeetdsouza/zoxide
#eval "$(zoxide init zsh)"

# https://github.com/junegunn/fzf
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# https://docs.jj-vcs.dev/latest/install-and-setup/#zsh
# Set up jj autocompletion
source <(jj util completion zsh)



# GNU cli tools:
# https://gist.github.com/skyzyx/3438280b18e4f7c490db8a2a2ca0b9da
# https://github.com/pkill37/linuxify

