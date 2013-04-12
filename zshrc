# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nebirhos"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# If the prompt displays the current directory as "~rvm_rvmrc_cwd", the fix to
# add the following to your shell file before sourcing rvm:
unsetopt auto_name_dirs

source $HOME/.shellrc

# When using iTerm2's feature allowing you to open new tabs / windows and
# "Reuse Previous Tab's Directory" then we need the following:
__rvm_project_rvmrc


# My bash theme ported to ZSH:

# Get the current ruby version in use with RVM:
if [ -e ~/.rvm/bin/rvm-prompt ]; then
    RUBY_PROMPT_="%{$fg_bold[black]%}#\$(~/.rvm/bin/rvm-prompt)"
else
  if which rbenv &> /dev/null; then
    RUBY_PROMPT_="%{$fg_bold[black]%}#\$(rbenv version | sed -e 's/ (set.*$//')"
  fi
fi

HOST_PROMPT_="%{$fg_bold[green]%}%n%{$fg_bold[black]%}@%{$fg[blue]%}%m%{$reset_color%}"
PATH_PROMPT="%{$fg_bold[yellow]%}%~%{$reset_color%}"
GIT_PROMPT="\$(git_prompt_info)"
precmd() { print -rP "$HOST_PROMPT_$RUBY_PROMPT_$GIT_PROMPT $PATH_PROMPT" }
PROMPT="%{$fg_bold[black]%}\$%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[black]%}#"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
