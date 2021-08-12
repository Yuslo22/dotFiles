# open .zshrc in editor
alias zshrc="$EDITOR ~/.zshrc"
alias reload="source ~/.zshrc"
# update system
alias update="sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean -y"
# get external ip
alias ipe="curl ipconfig.io/ip"
# shurthands
alias c="clear"
alias ls="ls -F --color=auto"
alias ll="ls -lh"
alias la="ls -a"
alias lh="ls -lisAd .[^.]*"
# automatically create parent dirs
alias mkdir="mkdir -p"
alias rmf="rm -rf"

# kill process on the given port
function killport() {
  if [[ $(sudo lsof -i:$1) ]]; then
    sudo kill -9 $(sudo lsof -t -i:$1)
    echo "port $1 killed"
  else
    echo "port not in use"
  fi
}