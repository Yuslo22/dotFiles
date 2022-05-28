# docker aliases
if type "docker" > /dev/null; then
    alias dbl='docker build'
    alias dpu='docker pull'
    alias dtop='docker top'

    # docker containers
    alias dls="docker container ls"
    alias dlsa="docker container ls -a"
    alias drm="docker container rm"
    alias drm!="docker container rm -f"
    alias dst='docker container start'
    alias dstp='docker container stop'
    alias dex="docker container exec"
    alias dexit="docker container exec -it"
    # run an interactive container with ubuntu
    alias dit="docker container run -it --rm ubuntu /bin/bash"

    function dclean() {
        echo "Cleaning up docker..."
        echo ""
        echo "Removing containers:"
        docker container prune -f
        echo "----------------"
        echo "Removing volumes:"
        docker volume prune -f
        echo "----------------"
        echo "Removing images:"
        docker image prune -a -f
        echo ""
    }
fi