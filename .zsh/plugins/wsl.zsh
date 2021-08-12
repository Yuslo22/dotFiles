# Running under WSL (Windows Subsystem for Linux)?
if [ $(uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/ip') ]; then
    WSL=true
else
    WSL=false
fi