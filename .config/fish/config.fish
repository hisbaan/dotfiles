abbr --add sp 'sudo pacman'

#bobthefish
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes

set PATH $PATH:/home/hisbaan/.local/bin/
export EDITOR='/usr/bin/nvim'

#sudo !!
function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end
