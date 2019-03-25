export ZSH=/Users/fezo/.oh-my-zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

ZSH_THEME="zero"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

alias lst="tree -I 'node*'"
alias lsl="ls -lhart"
alias python='python3'

export TERM=xterm-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
