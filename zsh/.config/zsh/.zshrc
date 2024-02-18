source $ZDOTDIR/exports.zsh

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select matcher-list 'm:{a-zA-Z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

HISTFILE=$ZDOTDIR/.zsh_history

# My bash theme ported to ZSH:
# eg josh@mpb
HOST_PROMPT_="%{$fg_bold[green]%}%n%{$fg_bold[black]%}@%{$fg[blue]%}%m%{$reset_color%}"
#GIT_PROMPT="\$(git_prompt_info)"
GIT_PROMPT=
# eg ~/code
PATH_PROMPT="%{$fg_bold[yellow]%}%~%{$reset_color%}"
precmd() { print -rP "$HOST_PROMPT_$GIT_PROMPT $PATH_PROMPT" }
PROMPT="%{$fg_bold[black]%}\$%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[black]%}#"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""



source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/functions.zsh

# Bindings might refer to functions defined in the above file.
bindkey -s '^o' 'lfcd\n'

# https://asdf-vm.com/
. $(brew --prefix asdf)/libexec/asdf.sh

# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# https://starship.rs/
# eval "$(starship init zsh)"
