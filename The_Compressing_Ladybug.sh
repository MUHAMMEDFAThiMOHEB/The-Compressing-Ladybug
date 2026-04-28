#!/bin/bash
#
# Author: Muhammad Fathy Moheb
# Date Created: 17/2/2026
# Date Modified: 28/4/2026

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
    echo "Target path = $target_path" 
    # -- pass by variable, this global varialbe will used as argument in all coming functions
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
        ls "$1"
    fi
    if [ "$isdir" = true ]; then
        echo "file is a directory"
        echo "Directory content ....."
        echo " "
        ls "$1"
        echo ""
    fi
    if [ "$isdir" = false ] && [ "$isfile" = false ]; then
        echo "file exist but it's neither regular file nor directory"
    fi
    if [ "$isempty" = true ]; then
        echo "directory is empty, Nothing to compress ....."
        get_input 
    fi
}

function list_cores(){ 
  PS3="Choose Operation --> "
  select fun1 in Archive Compress "Archive & Compress" quit ;do
    break
  done
}

function list_compressing(){
  PS3="Choose Compressing Tool ."
  select fun2 in gzip bzip2 xz ; do
    break
  done
}

function archive(){
  echo " Archive Starting ...."
  read -p "name .tar file {with out .tar} --> " name
  tar -cvf "$name".tar "$1"
  echo " # --- File Archived successfully --- # "
  ls -l "$name".tar
}


get_input "$@"
validate_input "$path"
list_cores
if [ $fun1 = "Archive" ]; then
  archive "$path"
  exit 0
else
  echo "will included later"
  exit 0
fi
exit 0
