if type "git" > /dev/null; then

    function git_current_branch() {
        local ref
        ref=$(git symbolic-ref --quiet HEAD 2> /dev/null)
        local ret=$?
        if [[ $ret != 0 ]]; then
            [[ $ret == 128 ]] && return  # no git repo.
            ref=$(git rev-parse --short HEAD 2> /dev/null) || return
        fi
        echo ${ref#refs/heads/}
    }
    # get the main branch of current repo
    function git_main_branch() {
        command git rev-parse --git-dir &>/dev/null || return
        local ref
        for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk}; do
            if command git show-ref -q --verify $ref; then
                echo ${ref:t}
                return
            fi
        done
        echo main
    }
    function grename() {
        if [[ -z "$1" || -z "$2" ]]; then
            echo "Usage: $0 old_branch new_branch"
            return 1
        fi

        # Rename branch locally
        git branch -m "$1" "$2"
        # Rename branch in origin remote
        if git push origin :"$1"; then
            git push --set-upstream origin "$2"
        fi
    }


    alias g="git"
    
    # git add
    alias ga="git add"
    alias gaa="git add --all"

    # git branch
    alias gb="git branch"

    # git commit
    alias gc="git commit"
    alias gc!="git commit --amend"
    alias gcn!="git commit --amend --no-edit"
    alias gca="git commit -a"
    alias gca!="git commit -a --amend"
    alias gcan!="git commit -a --amend --no-edit"
    alias gcm="git commit -m"
    alias gcm!="git commit --amend -m"
    alias gcmn!="git commit --amend --no-edit -m"
    alias gcma="git commit -a -m"
    alias gcma!="git commit -a --amend -m"
    alias gcman!="git commit -a --amend --no-edit -m"

    # git init
    alias gi="git init"

    # git pull
    alias gl="git pull"

    # git push
    alias gp="git push"
    alias gp!="git push --force"
    alias gpr="git push --rebase"
    
    # git rm
    alias grm="git rm"
    alias grmc="git rm --cached"

    # git restore
    alias grs='git restore'

    # git show
    alias gsh='git show'

    # git status
    alias gst="git status"
    alias gss="git status -s"

    # git switch
    alias gsw="git switch"
    alias gswc="git switch -c"
    alias gswm="git switch $(git_main_branch)"

    # git tag
    alias gt="git tag"
    alias gts="git tag -l"
    alias gtc="git tag -a"
    
fi