#!/bin/bash

# Author: Muhammad Fathy Moheb
# Date Created: 26/3/2026
# 
# Description:-
# test phase one "get user input" which is the target path that the script will run and affect in

# get the input
if [ $# -ne 0 ]; then  
  target_path="$1"
else
  read -p "Please, Input the target path: " target_path
fi
# test the input
if [ -e "$target_path" ]; then
    echo " Target Path exist --> $target_path"
  else
    echo "Path does not exist !!!"
    echo "Please input a valid path "
    exit 1
  fi

exit 0
