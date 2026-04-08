#!/bin/bash
#
# Author: Muhammad Fathy Moheb
# Date Created: 17/2/2026
# Date Modified: 7/3/2026

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

function main (){
  get_input "$@"

}

exit 0
