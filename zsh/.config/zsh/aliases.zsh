alias ls='ls -aF'
alias cd..='cd ..'
#alias ..='cd ..'
#alias ...='cd ../..'
alias cdl='cd -'
alias h=history
alias o=open
alias v=nvim
alias vim=nvim
alias j='z'
alias f='zi'
alias g='lazygit'

# confirm before overwriting something
# alias cp="cp -i"
# alias mv='mv -i'
# alias rm='rm -i'

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme Dracula" 
  alias catt="bat --theme Draclua" 
fi

#alias ag=ag --ignore-case