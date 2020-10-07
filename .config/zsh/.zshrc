# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/zsh/oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump zsh-autosuggestions fast-syntax-highlighting expand-ealias)

# autoload -U edit-command-line
# zle -N edit-command-line
# bindkey '^E' edit-command-line                   # Opens Vim to edit current command line
# bindkey '^R' history-incremental-search-backward # Perform backward search in command line history
# bindkey '^S' history-incremental-search-forward  # Perform forward search in command line history
# bindkey '^P' history-search-backward             # Go back/search in history (autocomplete)
# bindkey '^N' history-search-forward              # Go forward/search in history (autocomplete)

source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
alias cat="bat $argv"
alias cp="cp -i $argv"
alias df="df -h $argv"
alias dotfiles="/usr/bin/git --git-dir=/home/hisbaan/.dotfiles.git/ --work-tree=/home/hisbaan $argv"
alias emacs="emacsclient -c -a 'emacs'"
alias grep="rg $argv"
alias mv="mv -i $argv"
alias todo="emacsclient -c -a 'emacs' ~/Documents/uoft/todo.org"

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

bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history

bindkey '^e' edit-command-line

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
