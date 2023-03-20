# copy paste in vim mode
function x11-clip-wrap-widgets() {
    # NB: Assume we are the first wrapper and that we only wrap native widgets
    # See zsh-autosuggestions.zsh for a more generic and more robust wrapper
    local copy_or_paste=$1
    shift

    for widget in $@; do
        # Ugh, zsh doesn't have closures
        if [[ $copy_or_paste == "copy" ]]; then
            eval "
            function _x11-clip-wrapped-$widget() {
                zle .$widget
                xclip -in -selection clipboard <<<\$CUTBUFFER
            }
            "
        else
            eval "
            function _x11-clip-wrapped-$widget() {
                CUTBUFFER=\$(xclip -out -selection clipboard)
                zle .$widget
            }
            "
        fi

        zle -N $widget _x11-clip-wrapped-$widget
    done
}

local copy_widgets=(
    vi-yank vi-yank-eol vi-delete vi-backward-kill-word vi-change-whole-line
)
local paste_widgets=(
    vi-put-{before,after}
)

x11-clip-wrap-widgets copy $copy_widgets
x11-clip-wrap-widgets paste  $paste_widgets

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


function proj () {
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
