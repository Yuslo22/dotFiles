# [Ctrl-RightArrow] - move forward one word
bindkey "^[[1;5C" forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey "^[[1;5D" backward-word
# [Ctrl-Delete] - delete whole forward-word
bindkey '^[[3;5~' kill-word
# Start typing + [Up-Arrow] - fuzzy find history forward
if [[ -n "${terminfo[kcuu1]}" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# Start typing + [Down-Arrow] - fuzzy find history backward
if [[ -n "${terminfo[kcud1]}" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi