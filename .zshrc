# ZSH Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-theme-agnoster/agnoster.zsh-theme

# history
SAVEHIST=1000  # Save most-recent 1000 lines
HISTFILE=~/.zsh_history

# preferred editor
if type "code" > /dev/null; then
    export EDITOR="code"
else
    export EDITOR="nano"
fi

# Running under WSL (Windows Subsystem for Linux)?
if [ $(uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/ip') ]; then
    WSL=true
else
    WSL=false
fi

# docker aliases
if type "docker" > /dev/null; then
    alias drm="docker container rm $(docker container ls -f 'status=exited' -q)"
    alias dirm="docker image rm $(docker image ls -f 'dangling=true') -q"
    alias dit="docker run -it --rm ubuntu /bin/bash"
fi

# docker-compose aliases
if type "docker-compose" > /dev/null; then
    alias dcu="docker-compose up -d"
    alias dcd="docker-compose down"
    alias dcr="docker-compose restart"
fi

# keybinds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# zsh utils
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

# ssh-keygen shorthands
alias keygen-ed="ssh-keygen -t ed25519"
alias keygen-rsa="ssh-keygen -t rsa -b 4096"

# delete all node_modules
alias delete-nodemodules="find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;"

# kill process on the given port
function killport() {
  if [[ $(sudo lsof -i:$1) ]]; then
    sudo kill -9 $(sudo lsof -t -i:$1)
    echo "port $1 killed"
  else
    echo "port not in use"
  fi
}

# Fix yadm encryption
export GPG_TTY=$(tty)

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion