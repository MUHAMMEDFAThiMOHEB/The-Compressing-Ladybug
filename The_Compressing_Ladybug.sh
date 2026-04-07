#!/bin/bash
#
# Author: Muhammad Fathy Moheb
# Date Created: 17/2/2026
# Date Modified: 31/3/2026

# Description:-
#
# Script to provide and list all compressing & archiving tools and option for the user to choose
# which wanted one to use for a given file or directory contect
#
# script provides archiving only, compressing only and both combined if wanted


echo " # --------------------------- Under Testing ------------------------ # "

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

get_input "$1"
exit 0

function validate_input (){
  local target_path=$1
if [ -e "$target_path" ]; then
    echo "Target Path exist --> $target_path"
    echo "$target_path"
  else
    echo "Path does not exist !!!"
    echo "Please input a valid path "
    get_input 
fi
}
# Phase two - List and options for user to choose
function functions_list () {
  PS3="Choose the process: "

  select option in Archive Compress "Archive & Compress" Quit; do
    case "$option" in
      Archive|Compress|"Archive & Compress")
        echo "$option"
        return
        ;;
      Quit)
        exit 0
        ;;
      *)
        echo "Invalid option"
        function_list
        ;;
    esac 
  done
}
# Phase three - Core Function and it's work flow

# proceeding confirmation function

function proceeding () {
  read -p "Do you want to proceed ? [Y/N]: " choice
  case "$choice" in
    [Yy])
      return 0 ;;
    [Nn])
      return 1 ;; 
      *)
      echo "Invalid option !!, Y/y For yes, N/n for no"
      proceeding ;;
  esac
}

# Main Script's function work flow, where choosed action will be performed
get_input "$@"
echo "The value returned from get_input function is $target_path"
exit 0
