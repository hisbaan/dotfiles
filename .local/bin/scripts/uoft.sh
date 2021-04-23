#!/bin/env bash

if [[ $# == 0 ]]
then
    cd ~/Documents/uoft; ranger --choosedir=$HOME/.config/ranger/dir
    LASTDIR='cat $HOME/.config/ranger/dir';
    cd "$LASTDIR"
elif [[ $# == 1 ]]
then
    # cd ~/Documents/uoft/csc111; source ranger

    case "$1" in
        csc111|111) cd ~/Documents/uoft/csc111; ranger --choosedir=$HOME/.config/ranger/dir ;;
        vic122|122) cd ~/Documents/uoft/vic122; ranger --choosedir=$HOME/.config/ranger/dir ;;
        mat137|137) cd ~/Documents/uoft/mat137; ranger --choosedir=$HOME/.config/ranger/dir ;;
        ant193|193) cd ~/Documents/uoft/ant193; ranger --choosedir=$HOME/.config/ranger/dir ;;
        mat223|223) cd ~/Documents/uoft/mat223; ranger --choosedir=$HOME/.config/ranger/dir ;;
        *) echo "Course not found"; exit ;; # set var here to decide whether or not to cd with
    esac
    LASTDIR=$(cat $HOME/.config/ranger/dir)
    echo "$LASTDIR"
    cd "$LASTDIR"
else
    echo "Incorrect number of arguments"
fi
