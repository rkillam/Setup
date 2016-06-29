#!/bin/bash

# NOTE: colours NEED to have the escaped square brackets around them
# Coloured Foreground
reset='\[\e[00m\]'
bold='\[\e[01m\]'
red='\[\e[31m\]'
green='\[\e[32m\]'
orange='\[\e[33m\]'
blue='\[\e[34m\]'
purple='\[\e[35m\]'
cyan='\[\e[36m\]'
gray='\[\e[37m\]'
bright='\[\e[39m\]'

# NOTE: colours NEED to have the escaped square brackets around them
# Coloured Background
bg_black='\[\e[0;100m\]'      # Black
bg_red='\[\e[41m\]'        # Red
bg_green='\[\e[42m\]'      # Green
bg_yellow='\[\e[43m\]'     # Yellow
bg_blue='\[\e[44m\]'       # Blue
bg_purple='\[\e[45m\]'     # Purple
bg_cyan='\[\e[46m\]'       # Cyan
bg_white='\[\e[47m\]'      # White

# Function to only show the last 3 folders in the pwd path
function short_pwd {
    python -c "print('/'.join('$(pwd)'.split('/')[-3:]))"
}

export VC_TYPE="GIT"
export VC_COLOUR="$bg_black$orange"

function vcs {
    case $VC_TYPE in
        "GIT")
            export VC_TYPE="SVN"
            export VC_COLOUR="$bg_black$green"
            ;;

        "SVN")
            export VC_TYPE="GIT"
            export VC_COLOUR="$bg_black$orange"
            ;;

        *)
            export VC_TYPE="GIT"
            export VC_COLOUR="$bg_black$orange"
            ;;
    esac
}

function gitroot {
    ROOT=$(git rev-parse --show-toplevel 2> /dev/null)

    if [ $? -eq 0 ]; then
        cd $ROOT
    else
        echo "Not in git repo"
    fi
}

function vcPrompt {
    OIFS=$IFS
    IFS=$(echo $IFS | sed 's/ //g')

    # Default values for version control parameters
    branch=""
    edits=""
    ahead_behind=""

    if [[ "$VC_TYPE" = "SVN" ]]; then
        # Use an svn command to test if we're in a svn repo
        svn info >> /dev/null 2>&1

        # Check error code of previous command, if there was an error ($? != 0)
        # then we are not in a svn repo
        if [ $? -eq 0 ]; then
            branch=""

            # Determine what files have been changed and how they've been changed
            edits=$(svn status | ~/.vc_short_diff.py)

            # If the length of the edits string is none zero (I.e. we have edits)
            if [ -n "$edits" ]; then
                edits="($edits)"
            fi
        fi

    elif [[ "$VC_TYPE" = "GIT" ]]; then
        # Use a git command to test if we're in a git repo
        git rev-parse --show-toplevel >> /dev/null 2>&1

        # Check error code of previous command, if there was an error ($? != 0)
        # then we are not in a git repo
        if [ $? -eq 0 ]; then
            # Get the current branch
            branch="[$(git branch -a | grep "*" | awk '{print $2}')]"

            # If there are no branches
            if [ $? -ne 0 ]; then
                branch=""
            fi

            # Determine what files have been changed and how they've been changed
            edits=$(git status -s 2> /dev/null | ~/.vc_short_diff.py)

            # If the length of the edits string is none zero (I.e. we have edits)
            if [ -n "$edits" ]; then
                edits="($edits)"
            fi

            NUM_STASHES=$(git stash list | wc -l)
            if [ ${NUM_STASHES} -ne 0 ]; then
                num_stashes=" ${NUM_STASHES}"
            fi

            AHEAD=$(git rev-list @{u}..HEAD 2>/dev/null | wc -l)
            BEHIND=$(git rev-list HEAD..@{u} 2>/dev/null | wc -l)

            if [ $AHEAD -ne 0 ]; then
                ahead_behind="$ahead_behind +$AHEAD"
            fi

            if [ $BEHIND -ne 0 ]; then
                ahead_behind="$ahead_behind -$BEHIND"
            fi
            ahead_behind="$ahead_behind "
        fi
    fi

    coloured_branch="$reset${bold}${green}$branch"
    coloured_edits="$reset$bold$orange$edits"
    coloured_stashes="$reset$bold$cyan$num_stashes"
    coloured_ahead_behind="$reset$bold$red$ahead_behind"

    newPS1="${coloured_branch}${coloured_edits}${coloured_stashes}${coloured_ahead_behind}"

    IFS=$OIFS

    echo -n $newPS1
}

function configPrompt {
    if [[ "${VIRTUAL_ENV}" != "" ]]; then
        virt_env="($(basename ${VIRTUAL_ENV}))"
    else
        virt_env=""
    fi

    # Base PS1
    coloured_dir="$reset$bold$purple$USER@$(hostname)[$green\t$purple]:${bold}${blue}$(short_pwd)"

    export PS1="${virt_env}${VC_COLOUR}${VC_TYPE}:$reset${coloured_dir} $(vcPrompt)\n$bright> "
}

export PROMPT_COMMAND="configPrompt"
