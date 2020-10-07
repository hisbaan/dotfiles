# # Temporarily change options.
# 'builtin' 'local' '-a' 'p10k_config_opts'
# [[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
# [[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
# [[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
# 'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

# () {
#   emulate -L zsh -o extended_glob

#   # Unset all configuration options.
unset -m 'POWERLEVEL9K_*|DEFAULT_USER'

# Left prompt segments.
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs prompt_char)
# Right prompt segments.
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
#   typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
#     command_execution_time    # previous command duration
#     virtualenv                # python virtual environment
#     context                   # user@host
#     # time                    # current time
#   )

# Basic style options that define the overall prompt look.
POWERLEVEL9K_BACKGROUND=

typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=   # no surrounding whitespace
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '   # separate segments with a space
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=         # no end-of-line symbol
POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=                       # no segment icons

POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

POWERLEVEL9K_PROMPT_CHAR_PREFIX='%F{15}… '
POWERLEVEL9K_PROMPT_CHAR_CONTENT_EXPANSION='●'

typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIINS_FOREGROUND=green
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIINS_FOREGROUND=red

typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_FOREGROUND=blue
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_FOREGROUND=yellow
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_FOREGROUND=magenta

#   # Magenta prompt symbol if the last command succeeded.
#   typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=$magenta
#   # Red prompt symbol if the last command failed.
#   typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND=$red
#   # Default prompt symbol.
#   typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
#   # Prompt symbol in command vi mode.
#   typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
#   # Prompt symbol in visual vi mode is the same as in command mode.
#   typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='❮'
#   # Prompt symbol in overwrite vi mode is the same as in command mode.
#   typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=false

#   # Grey Python Virtual Environment.
#   typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=$grey
#   # Don't show Python version.
#   typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
#   typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

# Current directory.
POWERLEVEL9K_DIR_FOREGROUND=blue

# Dir truncation
POWERLEVEL9K_SHORTEN_STRATEGY=none

#   # Context format when root: user@host. The first part white, the rest grey.
#   typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE="%F{$white}%n%f%F{$grey}@%m%f"
#   # Context format when not root: user@host. The whole thing grey.
#   typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE="%F{$grey}%n@%m%f"
#   # Don't show context unless root or in SSH.
#   typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_CONTENT_EXPANSION=

#   # Show previous command duration only if it's >= 5s.
#   typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=5
#   # Don't show fractional seconds. Thus, 7s rather than 7.3s.
#   typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
#   # Duration format: 1d 2h 3m 4s.
#   typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
#   # Yellow previous command duration.
#   typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=$yellow

POWERLEVEL9K_VCS_PREFIX='%f• '
POWERLEVEL9K_VCS_FOREGROUND=8
POWERLEVEL9K_VCS_LOADING_TEXT=
POWERLEVEL9K_VCS_BRANCH_ICON=
POWERLEVEL9K_VCS_COMMIT_ICON='@'
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes)

#   # Grey Git prompt. This makes stale prompts indistinguishable from up-to-date ones.
#   typeset -g POWERLEVEL9K_VCS_FOREGROUND=$grey

#   # Disable async loading indicator to make directories that aren't Git repositories
#   # indistinguishable from large Git repositories without known state.
#   typeset -g POWERLEVEL9K_VCS_LOADING_TEXT=

#   # Don't wait for Git status even for a millisecond, so that prompt always updates
#   # asynchronously when Git state changes.
#   typeset -g POWERLEVEL9K_VCS_MAX_SYNC_LATENCY_SECONDS=0

#   # Cyan ahead/behind arrows.
#   typeset -g POWERLEVEL9K_VCS_{INCOMING,OUTGOING}_CHANGESFORMAT_FOREGROUND=$cyan
#   # Don't show remote branch, current tag or stashes.
#   typeset -g POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind)
#   # Don't show the branch icon.
#   typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=
#   # When in detached HEAD state, show @commit where branch normally goes.
#   typeset -g POWERLEVEL9K_VCS_COMMIT_ICON='@'
#   # Don't show staged, unstaged, untracked indicators.
#   typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED}_ICON=
#   # Show '*' when there are staged, unstaged or untracked files.
#   typeset -g POWERLEVEL9K_VCS_DIRTY_ICON='*'
#   # Show '⇣' if local branch is behind remote.
#   typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=':⇣'
#   # Show '⇡' if local branch is ahead of remote.
#   typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=':⇡'
#   # Don't show the number of commits next to the ahead/behind arrows.
#   typeset -g POWERLEVEL9K_VCS_{COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=1
#   # Remove space between '⇣' and '⇡' and all trailing spaces.
#   typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${${${P9K_CONTENT/⇣* :⇡/⇣⇡}// }//:/ }'

#   # Grey current time.
#   typeset -g POWERLEVEL9K_TIME_FOREGROUND=$grey
#   # Format for the current time: 09:51:02. See `man 3 strftime`.
#   typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
#   # If set to true, time will update when you hit enter. This way prompts for the past
#   # commands will contain the start times of their commands rather than the end times of
#   # their preceding commands.
#   typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false

#   # Transient prompt works similarly to the builtin transient_rprompt option. It trims down prompt
#   # when accepting a command line. Supported values:
#   #
#   #   - off:      Don't change prompt when accepting a command line.
#   #   - always:   Trim down prompt when accepting a command line.
#   #   - same-dir: Trim down prompt when accepting a command line unless this is the first command
#   #               typed after changing current working directory.
#   typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off

#   # Instant prompt mode.
#   #   - off:     Disable instant prompt. Choose this if you've tried instant prompt and found
#   #              it incompatible with your zsh configuration files.
#   #   - quiet:   Enable instant prompt and don't print warnings when detecting console output
#   #              during zsh initialization. Choose this if you've read and understood
#   #              https://github.com/romkatv/powerlevel10k/blob/master/README.md#instant-prompt.
#   #   - verbose: Enable instant prompt and print a warning when detecting console output during
#   #              zsh initialization. Choose this if you've never tried instant prompt, haven't
#   #              seen the warning, or if you are unsure what this all means.
POWERLEVEL9K_INSTANT_PROMPT=verbose

#   # Hot reload allows you to change POWERLEVEL9K options after Powerlevel10k has been initialized.
#   # For example, you can type POWERLEVEL9K_BACKGROUND=red and see your prompt turn red. Hot reload
#   # can slow down prompt by 1-2 milliseconds, so it's better to keep it turned off unless you
#   # really need it.
POWERLEVEL9K_DISABLE_HOT_RELOAD=true

# # Tell `p10k configure` which file it should overwrite.
POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

# (( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
# 'builtin' 'unset' 'p10k_config_opts'

#   # If p10k is already loaded, reload configuration.
(( ! $+functions[p10k] )) || p10k reload
