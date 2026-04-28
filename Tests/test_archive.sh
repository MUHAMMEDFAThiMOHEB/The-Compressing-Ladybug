#!/bin/bash

function archive(){
  echo " Archive Starting ...."
  read -p "name .tar file --> " name
  tar -cvf "${name}".tar "$1"
  echo " # --- File Archived successfully --- # "
}

read -p "Input a file to archive:- " file

archive "$file"

exit 0 
