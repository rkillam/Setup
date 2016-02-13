#!/bin/bash

reset='\[\e[00m\]'
bold='\[\e[01m\]'
red='\[\e[31m\]'
green='\[\e[32m\]'
orange='\[\e[33m\]'
blue='\[\e[34m\]'
purple='\[\e[35m\]'
cyan='\[\e[36m\]'
gray='\[\e[37m\]'
white='\[\e[38m\]'
bright='\[\e[39m\]'

OIFS=$IFS
IFS=$(echo $IFS | sed 's/ //g')

function short_pwd {
    pwd=$(pwd)

    first=$(basename "$pwd")
    rest=$(dirname "$pwd")
    second=$(basename "$rest")
    rest=$(dirname "$rest")
    third=$(basename "$rest")

    if [ "$second" = "/" ]; then
        echo -n "/$first"
    elif [ "$third" = "/" ]; then
        echo -n "/$second/$first"
    else
        echo -n "$third/$second/$first"
    fi
}

colordir="$bold$purple$USER[$green\t$purple]:${bold}${blue}$(short_pwd)"

tmp=$(git rev-parse --show-toplevel 2>/dev/null)

if [ $? -ne 0 ]; then
    GIT=0
else
    GIT=1
fi

if [ $GIT -ne 0 ]; then
    # We're in a git repo
    git_branch=$(git branch | grep "*" | awk '{print $2}')

    if [ $? -ne 0 ]; then
        git_branch=""
    fi

    branch=" $bold$red($git_branch)$reset"

    EDITS=$(git_short_diff.pl --PathIn "$(pwd)")

    if [ -n "$EDITS" ]; then
        edits="$bold$orange($EDITS)$reset"
    else
        edits=""
    fi

    AHEAD=$(git rev-list @{u}..HEAD 2>/dev/null | wc -l)
    BEHIND=$(git rev-list HEAD..@{u} 2>/dev/null | wc -l)

    if [ $AHEAD -ne 0 -a $BEHIND -eq 0 ]; then
        ahead_behind="$bold$red +$AHEAD"
    elif [ $BEHIND -ne 0 -a $AHEAD -eq 0 ]; then
        ahead_behind="$bold$red -$BEHIND".
    elif [ $AHEAD -eq 0 -a $BEHIND -eq 0 ]; then
        ahead_behind=""
    else
        ahead_behind="$bold$red +$AHEAD -$BEHIND"
    fi

    git=" ${bold}${green}[$git_branch]$edits$ahead_behind"
    newPS1="$reset$colordir$reset$git ->$bright "
else
    newPS1="$reset$colordir$reset ->$bright "
fi

echo -n $newPS1
