# docker aliases
if type "docker" > /dev/null; then
    alias drm="docker container rm $(docker container ls -f 'status=exited' -q)"
    alias dirm="docker image rm $(docker image ls -f 'dangling=true') -q"
    alias dit="docker run -it --rm ubuntu /bin/bash"
fi