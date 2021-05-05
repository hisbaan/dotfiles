#!/bin/bash

if [[ $(pidof -s polybar) ]]
then
    polybar-msg cmd restart
else
    polybar mainbar-bspwm &
fi
