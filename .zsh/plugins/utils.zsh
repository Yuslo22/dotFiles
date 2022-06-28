# kill process on the given port
function killport() {
  if [[ $(sudo lsof -i:$1) ]]; then
    sudo kill -9 $(sudo lsof -t -i:$1)
    echo "port $1 killed"
  else
    echo "port not in use"
  fi
}

# open .zshrc in editor
alias zshrc="$EDITOR ~/.zshrc"
alias reload="source ~/.zshrc"

# shortcuts
alias c="clear"

# package manager
alias updatefull="sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean -y"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias apti="sudo apt-get install"
alias aptr="sudo apt-get remove"

# ls
alias ls="ls -F --color=auto"
alias ll="ls -lh"
alias la="ls -a"
alias lh="ls -lisAd .[^.]*"
alias l.='ls -d .*'

# cd
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."

# mkdir
alias mkdir="mkdir -p"

# df
alias df="dh -h"
alias du="du -ch"

# get external ip
alias ipe="curl ipconfig.io"
alias ipe4="curl -4 ipconfig.io"
alias ipe6="curl -6 ipconfig.io"

# automatically create parent dirs
alias mkdir="mkdir -p"
alias rmf="rm -rf"

# confirmations / checks
alias mv="mv -i"
alias cp="cp -i"
alias ln="ln -i"
alias rm="rm -I --preserve-root"
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# clear dns cache
alias flushdns="sudo systemctl restart systemd-resolved"

# list open ports
alias openports="sudo lsof -i -P -n | grep LISTEN"
