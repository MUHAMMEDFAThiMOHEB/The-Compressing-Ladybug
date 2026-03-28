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

if [ $# -ne 0 ]; then # in case user has input an arguement "path"
  target_path="$1"
else
  read -p "Please, Input the target path: " target_path
fi

if [ -e "$target_path" ]; then
    echo " Target Path exist --> $target_path"
    echo ""
  else
    echo "Path does not exist !!!"
    echo "Please input a valid path "
    exit 1
  fi

# Phase two - List and options for user to choose

PS3="Choose the process: "

select option in Archive Compress "Archive & Compress"; do
  echo "" 
  echo "$option choosen "
  echo ""
  break
done

# Phase three - Core Function and it's work flow

# proceeding confirmation function

proceeding () {
  read -p "Do you want to proceed ? [Y/N]: " choice
  case "$choise" in
    Yy)
      return 0 ;;
    Nn)
      return 1 ;; 
      *)
      echo "Invalid option !!, Y/y For yes, N/n for no"
      proceeding ;;
  esac
}

case "$option" in
  Archive)
    echo " !!! All files in $target_path will be compressed !!! "
    echo ""
    lsd -la
    echo ""
    proceeding ;;
    
  esac

exit 0
