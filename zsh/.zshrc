source $HOME/.shellrc

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

# To get shell history in iex
export ERL_AFLAGS="-kernel shell_history enabled"

. $(brew --prefix asdf)/libexec/asdf.sh


# https://starship.rs/
# eval "$(starship init zsh)"
