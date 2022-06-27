# delete all node_modules
alias delete-nodemodules="find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/$USER/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
