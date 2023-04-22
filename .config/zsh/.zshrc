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

alias cat="bat $argv"
alias cp="cp -i $argv"
alias df="df -h $argv"
alias rm="trash-put $argv"
alias undo-rm="trash-restore $argv"
alias dotfiles="/usr/bin/git --git-dir=/home/hisbaan/.dotfiles.git/ --work-tree=/home/hisbaan $argv"
alias system="/usr/bin/git --git-dir=/home/hisbaan/.system-setup.git/ --work-tree=/ $argv"
alias grep="rg $argv"
alias ls='exa --color=auto'
alias mv="mv -i $argv"
alias rs='rsync --numeric-ids --info=progress2'
alias bin="cd ~/projects/binocularss/"
alias iwlan="iwctl station wlan0 "
alias script="SHELL=bash script"

alias uoft="cd ~/Documents/uoft/ ; . ranger"

# start flavours
###################
### TTY Colours ###
###################

if [ "$TERM" = "linux" ]
then
  echo -en "\e]P0191724"
  echo -en "\e]P1f38ba8"
  echo -en "\e]P2a6e3a1"
  echo -en "\e]P3fab387"
  echo -en "\e]P489b4fa"
  echo -en "\e]P5cba6f7"
  echo -en "\e]P694e2d5"
  echo -en "\e]P7cdd6f4"
  echo -en "\e]P8585b70"
  echo -en "\e]P9f38ba8"
  echo -en "\e]PAa6e3a1"
  echo -en "\e]PBfab387"
  echo -en "\e]PC89b4fa"
  echo -en "\e]PDcba6f7"
  echo -en "\e]PE94e2d5"
  echo -en "\e]PFe2e1e7"
  clear # Clear artifacts
fi
# end flavours

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

export EDITOR='nvim'

fpath=($ZSH/functions $ZSH/completions $fpath)

export PATH=$PATH:/home/hisbaan/.local/bin/scripts/:/home/hisbaan/.local/bin/scripts/color-scripts/:/home/hisbaan/.local/bin/scripts/xresources/:/home/hisbaan/.local/bin/scripts/rofi-spotlight:/home/hisbaan/.emacs.d/bin/:/home/hisbaan/.local/bin/:/home/hisbaan/.local/share/gem/ruby/3.0.0/bin/:/home/hisbaan/.rvm/bin:$CARGO_HOME/bin/:/home/hisbaan/.local/share/npm/bin/:/home/hisbaan/.ghcup/bin/

# ruby version management
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#############
### Other ###
#############

[[ -d "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompcache" ]] || mkdir -p -- "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompcache"
autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompdump"
zstyle ':completion:*' menu select
zmodload zsh/complist

############################
### Interactive Comments ###
############################

setopt interactivecomments

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

#################
### Functions ###
#################

source ~/.config/zsh/functions.zsh

###############
### Plugins ###
###############

eval "$(direnv hook zsh)"

# Powerlevel10k
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# zsh abbr
source /usr/share/zsh/plugins/zsh-abbr/zsh-abbr.plugin.zsh

# zsh autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh vim mode
source ~/.config/zsh/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh
# ZVM_CURSOR_STYLE_ENABLED=false

# zsh vim mode clipboard support
source /usr/share/zsh/plugins/zsh-system-clipboard/zsh-system-clipboard.zsh
if [[ $WAYLAND == 1 ]]; then
  ZSH_SYSTEM_CLIPBOARD_METHOD=wlc
elif [[ $WAYLAND == 0 ]]; then
  ZSH_SYSTEM_CLIPBOARD_METHOD=xcc
fi

# proper history behaviour
bindkey "\e[A" up-line-or-search
bindkey "\e[B" down-line-or-search

bindkey -M viins '^e' edit-command-line

# fast syntax highlighting -- should be last
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
