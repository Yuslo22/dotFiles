# preferred editor
if type "code" > /dev/null; then
    export EDITOR="code"
else
    export EDITOR="nano"
fi

# load plugins
if [ ! -z "$plugins" ]; then
    if [ "$plugins" = '*' ]; then
        for f in ~/.zsh/plugins/*; do source $f; done
    else
        for f in "${plugins[@]}"; do 
            if [ -f ~/.zsh/plugins/$f.zsh ]; then
                source ~/.zsh/plugins/$f.zsh
            fi;
        done
    fi
fi

# load theme
if [ ! -z "$theme" ]; then
    if [ -f ~/.zsh/themes/$theme.zsh-theme ]; then
        source ~/.zsh/themes/$theme.zsh-theme
    fi;
fi

# load android sdk
export PATH=$HOME/Applications/android/cmdline-tools/5.0/bin:$PATH
# load flutter
export PATH=$HOME/Applications/flutter/bin:$PATH
# chrome exe
export CHROME_EXECUTABLE="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"