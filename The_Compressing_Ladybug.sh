#!/bin/bash
#
# Author: Muhammad Fathy Moheb
# Date Created: 17/2/2026
# Date Modified: 28/3/2026

# Description:-
#
# Script to provide and list all compressing & archiving tools and option for the user to choose
# which wanted one to use for a given file or directory contect
#
# script provides archiving only, compressing only and both combined if wanted


echo "This is a Simulation of a Totol_Compress_Tool or TCT"
echo "This tool used to archive and compressed using client selected tools and options"
echo "BUILDING TESTING ENHANCING PHASE"
echo " # --------------------------- Test ------------------------ # "

# Phase one - get the input (destination path), then validate it
function get_input (){
  local target_path

if [ $# -ne 0 ]; then # in case user has input an arguement "path"
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
  echo "$target_path"
else
  read -p "Please, Input the target path: " target_path
  echo "$target_path"
fi
}

function validate_input (){
  local target_path=$1
if [ -e "$target_path" ]; then
    echo "Target Path exist --> $target_path"
    echo ""
  else
    echo "Path does not exist !!!"
    echo "Please input a valid path "
    exit 1
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
main (){
  local varialbe=$1
  variable=$(get_input "$@")
  variable=$(validate_input "$variable")
  functions_list
  proceeding
}
main "$@"
exit 0
