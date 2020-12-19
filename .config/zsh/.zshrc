# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

###############################
### Cleaning Home Directory ###
###############################

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
# export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
# export UNISON="$XDG_CONFIG_HOME"/unison # Breaks zsh autocomplete
export NVM_DIR="$XDG_DATA_HOME"/nvm

alias yarn='yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config'

###############
### Aliases ###
###############

alias cat="bat "
alias cp="cp -i "
alias df="df -h "
alias dotfiles="/usr/bin/git --git-dir=/home/hisbaan/.dotfiles.git/ --work-tree=/home/hisbaan $argv"
alias emacs="emacsclient -c -a 'emacs'"
alias grep="rg $argv"
alias ls="exa --color=auto"
alias mv="mv -i $argv"
alias todo="emacsclient -c -a 'emacs' ~/Documents/uoft/todo.org"
alias sudo='sudo '
alias uoft='cd ~/Documents/uoft/; . ranger'

###################
### TTY Colours ###
###################

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

###############
### History ###
###############

export HISTFILE="$HOME/.config/zsh/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt append_history
setopt hist_expire_dups_first
setopt share_history

###############
### Env Var ###
###############

if [[ -n $SSH_CONNECTION ]]
then
    export EDITOR='nvim'
else
    export EDITOR="emacsclient -c -a 'emacs'"
fi

export DISPLAY=":0"
export MOZ_USE_XINPUT2=1
export PATH=$PATH:/home/hisbaan/.local/bin/scripts/:/home/hisbaan/.local/bin/scripts/color-scripts/:/home/hisbaan/.local/bin/scripts/xresources/:/home/hisbaan/.emacs.d/bin/

#############
### Other ###
#############

[[ -d "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompcache" ]] || mkdir -p -- "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompcache"
autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompdump"
zstyle ':completion:*' menu select
zmodload zsh/complist

################
### Bindings ###
################

bindkey -v
export KEYTIMEOUT=1

autoload -U edit-command-line
zle -N edit-command-line

# Use hjkl to move around the tab menu
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect '^[[Z' reverse-menu-complete

bindkey '^e' edit-command-line

#################
### Functions ###
#################

source ~/.config/zsh/functions.zsh

###############
### Plugins ###
###############

# Powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# zsh abbr
source /usr/share/zsh/plugins/zsh-abbr/zsh-abbr.plugin.zsh

# zsh autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh vim mode
source ~/.config/zsh/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh

# Proper history behaviour
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey "\e[A" history-beginning-search-backward-end
bindkey "\e[B" history-beginning-search-forward-end

# fast syntax highlighting -- should be last
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
