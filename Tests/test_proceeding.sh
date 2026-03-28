#!/bin/bash

proceeding () {
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

proceeding
echo " choise is $? "

exit 0
