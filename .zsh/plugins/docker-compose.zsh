# docker-compose aliases
if type "docker-compose" > /dev/null; then
    alias dcu="docker-compose up -d"
    alias dcd="docker-compose down"
    alias dcr="docker-compose restart"
fi
