# colors for man pages
function man () {
    # mb - Start blinking
    # md - Start bold mode
    # me - End all mode like so, us, mb, md and mr
    # so - Start standout mode
    # se - End standout mode
    # us - Start underlining
    # ue - End underlining

    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;38;5;44m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[38;5;206m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[04;38;5;119m' \
    command man "$@"
}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

# Aliases
alias cat="bat $argv"
alias cp="cp -i $argv"
alias df="df -h $argv"
alias dotfiles="/usr/bin/git --git-dir=/home/hisbaan/.dotfiles.git/ --work-tree=/home/hisbaan $argv"
alias emacs="emacsclient -c -a 'emacs'"
alias grep="rg $argv"
alias ls='ls --color=auto'
alias mv="mv -i $argv"
alias todo="emacsclient -c -a 'emacs' ~/Documents/uoft/todo.org"

# Setting tty colour scheme
if [ "$TERM" = "linux" ]
then
  echo -en "\e]P0000000"
  echo -en "\e]P1E06C75"
  echo -en "\e]P298C379"
  echo -en "\e]P3D19A66"
  echo -en "\e]P441AFEF"
  echo -en "\e]P5BD93F9"
  echo -en "\e]P656B6C2"
  echo -en "\e]P7ABB2BF"
  echo -en "\e]P8000000"
  echo -en "\e]P9E06C75"
  echo -en "\e]PA98C379"
  echo -en "\e]PBD19A66"
  echo -en "\e]PC41AFEF"
  echo -en "\e]PDBD93F9"
  echo -en "\e]PE56B6C2"
  echo -en "\e]PFABB2BF"
  clear # Clear artifacts
fi

# Environmental Variables
if [[ -n $SSH_CONNECTION ]]
then
    export EDITOR='nvim'
else
    export EDITOR="emacsclient -c -a 'emacs'"
fi

export DISPLAY=":0"
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export HISTFILE="$HOME/.config/zsh/history"
export MOZ_USE_XINPUT2=1
export MOZ_X11_EGL=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export PATH=$PATH:/home/hisbaan/.local/bin/:/home/hisbaan/.local/bin/color-scripts/:/home/hisbaan/.local/bin/xresources/:/home/hisbaan/.emacs.d/bin/

# Enable Vim mode in ZSH
bindkey -v
export KEYTIMEOUT=1
zstyle ':completion:*' menu select
zmodload zsh/complist
autoload -U edit-command-line
zle -N edit-command-line

bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history

bindkey '^e' edit-command-line

###############
### Plugins ###
###############

# Powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Expand Ealias
source ~/.config/zsh/plugins/expand-ealias/expand-ealias.plugin.zsh

# zsh autosuggestions
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# fast syntax highlighting
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
