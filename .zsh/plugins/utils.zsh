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

function finddelete() {
  for n in "$@"; do
    find . -name "$n" -type d -prune -print -exec rm -rf '{}' \;
  done
}

# https://github.com/xvoland/Extract/blob/master/extract.sh
function extract {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
  else
    for n in "$@"; do
      if [ -f "$n" ]; then
        case "${n%,}" in
        *.cbt | *.tar.bz2 | *.tar.gz | *.tar.xz | *.tbz2 | *.tgz | *.txz | *.tar)
          tar xvf "$n"
          ;;
        *.lzma) unlzma ./"$n" ;;
        *.bz2) bunzip2 ./"$n" ;;
        *.cbr | *.rar) unrar x -ad ./"$n" ;;
        *.gz) gunzip ./"$n" ;;
        *.cbz | *.epub | *.zip) unzip ./"$n" ;;
        *.z) uncompress ./"$n" ;;
        *.7z | *.apk | *.arj | *.cab | *.cb7 | *.chm | *.deb | *.dmg | *.iso | *.lzh | *.msi | *.pkg | *.rpm | *.udf | *.wim | *.xar)
          7z x ./"$n"
          ;;
        *.xz) unxz ./"$n" ;;
        *.exe) cabextract ./"$n" ;;
        *.cpio) cpio -id <./"$n" ;;
        *.cba | *.ace) unace x ./"$n" ;;
        *.zpaq) zpaq x ./"$n" ;;
        *.arc) arc e ./"$n" ;;
        *.cso) ciso 0 ./"$n" ./"$n.iso" &&
          extract $n.iso && \rm -f $n ;;
        *)
          echo "extract: '$n' - unknown archive method"
          return 1
          ;;
        esac
      else
        echo "'$n' - file does not exist"
        return 1
      fi
    done
  fi
}

function makesudo {
  if [ -z "$1" ]; then
    echo "Usage:  make-sudo USER"
    exit
  fi

  if ! id -u "$1" >/dev/null 2>&1; then
    echo "user '$1' does not exist"
    exit
  fi

  echo "$1  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$1
  sudo usermod -aG sudo $
}