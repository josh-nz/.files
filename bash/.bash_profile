bind "set completion-ignore-case on"

source $HOME/.shellrc

# define colors
C_DEFAULT="\[\033[0m\]"
C_BLACK="\[\033[0;30m\]"
C_RED="\[\033[0;31m\]"
C_GREEN="\[\033[0;32m\]"
C_YELLOW="\[\033[0;33m\]"
C_BLUE="\[\033[0;34m\]"
C_MAGENTA="\[\033[0;35m\]"
C_CYAN="\[\033[0;36m\]"
C_WHITE="\[\033[0;37m\]"
C_BOLDBLACK="\[\033[1;30m\]"
C_BOLDRED="\[\033[1;31m\]"
C_BOLDGREEN="\[\033[1;32m\]"
C_BOLDYELLOW="\[\033[1;33m\]"
C_BOLDBLUE="\[\033[1;34m\]"
C_BOLDMAGENTA="\[\033[1;35m\]"
C_BOLDCYAN="\[\033[1;36m\]"
C_BOLDWHITE="\[\033[1;37m\]"
C_BG_BLACK="\[\033[40m\]"
C_BG_RED="\[\033[41m\]"
C_BG_GREEN="\[\033[42m\]"
C_BG_YELLOW="\[\033[43m\]"
C_BG_BLUE="\[\033[44m\]"
C_BG_MAGENTA="\[\033[45m\]"
C_BG_CYAN="\[\033[46m\]"
C_BG_WHITE="\[\033[47m\]"

# multi line prompt
export PS1="\n$C_BOLDGREEN\u$C_BOLDBLACK@$C_BLUE\h$C_BOLDBLACK $C_BOLDYELLOW\w\n$C_BOLDBLACK\$$C_DEFAULT "

function take {
  mkdir %1
  cd %1
}

function top10 {
  history |
    awk '{a[$2}++}END{for(i in a){print a[i] " " i}}' |
    sort -rn |
    head
}
