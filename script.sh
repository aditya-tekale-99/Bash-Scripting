#!/bin/bash

# script that takes all the files in the source folder,
# then reads the version of those,
# then copies all of those folders to build folder,
# unless it is secretinfo.md. it confirms with you
# the version first with yes or no (1 or 0)

echo "🔥🔥🔥Beginning build!! 🔥🔥🔥"
firstline=$(head -1 source/changelog.md)
# firstline has $ because it is already declared, the splitfirstline
# variable is currently being made therefore not being refered to
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}

echo "version: $version"
echo "would you like to change version? 1=Yes, 0=No"
read versioncontinue

if [ $versioncontinue -eq 1 ]
then
  echo "OK"
  for file in source/*
  do
    if [ "$file" == "source/secretinfo.md" ]
    then
      echo "$file is not being copied"
    else
      echo "$file"
      cp $file build
    fi
  done
  echo "copied code for version $version:"
  ls build
else
  echo "please come back when ready"
fi