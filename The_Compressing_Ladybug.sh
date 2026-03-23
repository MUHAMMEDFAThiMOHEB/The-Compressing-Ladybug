#!/bin/bash
#
# Author: Muhammad Fathy Moheb
# Date Created: 17/2/2026
# Date Modified: 23/3/2026

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

if [ "$@" = "" ]; then
  read -p "Please, input the target path/file: " target_path
else
  target_path=$@
fi

echo "Target path = $target_path"

PS3="Choose the process: "
select option in Archive Compress "Archive & Compress";
do

  echo "${option} ....."

  case "$option" in

    "Archive") 
               echo "Archiving the target files --> $target_path ....."
               tar -cvf backup_"$(date +d%-%m-%Y %H-%M-%S)".tar $target_path
               echo ""
               echo " --- Finished --- ";;

    "Compress") 

      PS3="Choose Compressing Tool "
      select C in gzip bzip2 xz;
      do
        echo "${C_option} choosen !!!!"
        case $C in
          "gzip")
            gzip $target_path
            echo "Target file compressed by gzip tool ";;
          "bzip2")
            bzip2 $target_path
            echo "Target file compressed by bzip2 tool ";;
          "*")
            echo "invalid option !!!";;
        esac

      break
    done;;

 

  "Archive & Compress") 
    echo "tar command can used with some options in order to do both";;
   *)
     echo "Invalid choose !!!";;
     exit 1


esac
  break
done

exit 0
