#!/bin/bash

function get_input (){
  local arg_count=$#
  local target_path=$1

if [ $arg_count -ne 0 ]; then # in case user has input an arguement "path"
  echo "You have input -> $1 as the target_path"
  select op in Resume "Add another path" quit; do
    break
  done
  case "$op" in
    Resume)
      target_path=$1;;
    "Add another path")
      read -p "Input target path: " target_path;;
    quit)
      exit 0;;
    *)
      echo "Invalid Input !!! try again. "
      get_input;;
  esac
else
  read -p "Please, Input the target path: " target_path
fi
}

get_input "$@"
