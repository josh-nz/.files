# A ZSH guide is here: https://zsh.sourceforge.io/Guide/
source $ZDOTDIR/exports.zsh

HISTFILE=$ZDOTDIR/.zsh_history

# Basic auto/tab complete:
# https://thevaluable.dev/zsh-completion-guide-examples/
autoload -U compinit
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
# zstyle ':completion:*' list-colors "${(s.:.)LSCOLORS}"  # Doesn't seem to use LSCOLORS values (folders and symlinks have swapped colours from `ls` output).
# zstyle ':completion:*' list-colors '' # Default colours.
compinit
_comp_options+=(globdots)		# Include hidden files in completion.


source $ZDOTDIR/prompt.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/functions.zsh


# Bindings might refer to functions defined in the above file.
bindkey -s '^o' 'lfcd\n'


# https://asdf-vm.com/
. $(brew --prefix asdf)/libexec/asdf.sh

# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
