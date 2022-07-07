# fnm
export FNM_DIR="$HOME/.fnm"
export PATH=$FNM_DIR:$PATH
[ -s "$FNM_DIR/completion" ] && \. "$FNM_DIR/completion" # This loads nvm bash_completion
eval "$(fnm env --use-on-cd)"

# pnpm
export PNPM_HOME="/home/$USER/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# delete all node_modules
alias delete-nodemodules="find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;"

# pnpm
alias p="pnpm"
alias pd="pnpm dev"
alias pb="pnpm build"
alias pi="pnpm install"
alias pa="pnpm add"
alias pad="pnpm add --save-dev"
alias pu="pnpm up"
