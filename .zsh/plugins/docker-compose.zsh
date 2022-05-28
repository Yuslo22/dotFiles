# docker-compose aliases

if type "docker compose" > /dev/null; then
    dccmd='docker compose'
elif type "docker-compose" > /dev/null; then
    dccmd='docker-compose'
fi

if [ -n "$dccmd" ]; then
    alias dcu="$dccmd up"
    alias dcud="$dccmd up -d"
    alias dcd="$dccmd down"
    alias dcr="$dccmd restart"
    alias dcrm="$dccmd rm"
    alias dcp="$dccmd pull"
    alias dck="$dccmd kill"
    
    unset dccmd
fi

