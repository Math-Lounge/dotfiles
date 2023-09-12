#!/bin/bash

source ~/scripts/utils.sh

function mkold_chain ()
{
    [[ ! -e "$1.old" ]] && return
    if [[ -e "$1.older"  ]]
    then
        [[ -e "$1.oldest" ]] && exec_cmd rm $1.oldest
        exec_cmd mv $1.older $1.oldest
    fi
    exec_cmd mv $1.old $1.older
}

function mkold_exec ()
{
    [[ ! -e "$1" ]] && warn "File $1 does not exit" && return
    mkold_chain $1
    local NOW=$(date +%Y%m%d_%H%M%S)
    exec_cmd mv $1 $1.${NOW}
    exec_cmd ln -s $1.${NOW} $1.old
}

[[ $# -eq 0 ]] && fatal "No files provided"

for F in $@; do :; mkold_exec $F; done;

