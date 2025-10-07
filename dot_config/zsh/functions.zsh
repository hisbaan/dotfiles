# colors for man pages
function man () {
    # mb - Start blinking
    # md - Start bold mode
    # me - End all mode like so, us, mb, md and mr
    # so - Start standout mode
    # se - End standout mode
    # us - Start underlining
    # ue - End underlining

    export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
    export LESS_TERMCAP_md=$(tput bold; tput setaf 5) # purple
    export LESS_TERMCAP_me=$(tput sgr0)
    export LESS_TERMCAP_so=$(tput bold; tput setaf 0; tput setab 5) # yellow on purple
    export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
    export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
    export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
    export LESS_TERMCAP_mr=$(tput rev)
    export LESS_TERMCAP_mh=$(tput dim)
    export LESS_TERMCAP_ZN=$(tput ssubm)
    export LESS_TERMCAP_ZV=$(tput rsubm)
    export LESS_TERMCAP_ZO=$(tput ssupm)
    export LESS_TERMCAP_ZW=$(tput rsupm)
    command man "$@"
}

function org() {
    if [[ $# == 1 ]]
    then
        cd ~/Documents/org
        nvim $1
    else
        cd ~/Documents/org
        nvim $(fzf)
    fi
}

function _org() {
    local context state line
    typeset -A opt_args

    _arguments \
        '1:: :->dir'

    if [[ $state == dir ]]; then
        local -a dirs

        dirs=( ~/Documents/org/*(N) )
        (( $#dirs )) && \
            compadd "$@" - ${dirs#~/Documents/org/}
    fi
}
compdef _org org

function note() {
    cd ~/Documents/obsidian/ || exit

    if [[ $# -eq 0 ]]
    then
        nvim . +ObsidianQuickSwitch
        cd -
        return
    fi

    if [[ $1 = "cd" ]]
    then
        return
    elif [[ $1 = "browse" ]]
    then
        nvim .
    elif [[ $1 = "new" ]]
    then
        nvim . +ObsidianNew
    else
        nvim . +"ObsidianNew $1"
    fi
    cd -
}

function _note() {
    local context state line
    typeset -A opt_args

    _arguments \
        '1:: :->arg'

    if [[ $state == "arg" ]]; then
        compadd "cd" "browse" "new"
    fi
}
compdef _note note

function proj() {
    if [[ $# == 1 ]]
    then
        cd ~/projects/$1
    else
        cd ~/projects/
        cd $(fzf | awk 'BEGIN{FS=OFS="/"}{NF--; print}')
    fi
}

function _proj() {
    local context state line
    typeset -A opt_args

    _arguments \
        '1:: :->dir'

    if [[ $state == dir ]]; then
        local -a dirs

        dirs=( ~/projects/*(N) )
        (( $#dirs )) && \
            compadd "$@" - ${dirs#~/projects/}
    fi
}
compdef _proj proj

function conf () {
    if [[ $# == 1 ]]
    then
        cd ~/.config/$1
    else
        cd ~/.config/
        cd $(fzf | awk 'BEGIN{FS=OFS="/"}{NF--; print}')
    fi
}

function _conf() {
    local context state line
    typeset -A opt_args

    _arguments \
        '1:: :->dir'

    if [[ $state == dir ]]; then
        local -a dirs

        dirs=( ~/.config/*(N) )
        (( $#dirs )) && \
            compadd "$@" - ${dirs#~/.config/}
    fi
}
compdef _conf conf

function ya() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    	cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
