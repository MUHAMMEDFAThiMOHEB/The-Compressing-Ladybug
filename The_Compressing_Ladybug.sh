#!/bin/bash
#
# Author: Muhammad Fathy Moheb
# Date Created: 17/2/2026
# Date Modified: 8/3/2026

# Description:-
#
# Script to provide and list all compressing & archiving tools and option for the user to choose
# which wanted one to use for a given file or directory contect
#
# script provides archiving only, compressing only and both combined if wanted

# ---------------------------------------------------------------
# Phase one - get the input (destination path), then validate it
function get_input() {
  local target_path="$1"

  if [ $# -gt 0 ]; then
    echo "You have input -> $target_path as the target_path"
    PS3="Choose: "

    select op in Resume "Add another path" quit; do
      case "$op" in
        Resume)
          path=$target_path
          break
          ;;
        "Add another path")
          read -p "Input target path: " target_path
          get_input "$target_path"
          ;;
        quit)
          exit 0
          ;;
        *)
          echo "Invalid input! Try again."
          ;;
      esac
      break
    done
  else
   local target_path=""
    read -p "Please, Input the target path: " target_path
    path=$target_path 
  fi
}

# phase two: validate user input
function validate_input() {

    local isexist=false
    local isfile=false
    local isdir=false
    local isempty=false

    if [ -e "$1" ]; then
        isexist=true
    fi

    if [ -d "$1" ]; then
        isdir=true
    elif [ -f "$1" ]; then
        isfile=true
    fi

    if [ "$isdir" = true ] && [ -z "$(ls -A $1)" ]; then
        isempty=true
    fi

    if [ "$isexist" = true ]; then
        echo "file exists"
    fi
    if [ "$isfile" = true ]; then
        echo "file is a regular file"
        lsd -l "$1"
    fi
    if [ "$isdir" = true ]; then
        echo "file is a directory"
        lsd -l "$1"
    fi
    if [ "$isdir" = false ] && [ "$isfile" = false ]; then
        echo "file exist but it's neither regular file nor directory"
    fi
    if [ "$isempty" = true ]; then
        echo "directory is empty, Nothing to compress ....."
        get_input 
    fi
}

get_input "$@"
validate_input "$path"


exit 0
