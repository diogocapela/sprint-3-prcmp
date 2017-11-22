#!/bin/bash

IFS=$'\n'
i=1

if [ $# -eq 1 ]
then
  for pasta in $(ls -d1 */)
  do
    for file in $(ls -1 $pasta)
    do
      while read -r line
      do
        if [ "$(echo $line | cut -d ":" -f1)" = "$1" ]
        then
          if [ $i = 1 ]
          then
            echo "${file::-4},$(echo $line | cut -d ":" -f2)" >  "/tmp/tickets/${pasta::-1}-$(echo $line | cut -d ":" -f1).csv"
            i=$(($i+1))
          else
            echo "${file::-4},$(echo $line | cut -d ":" -f2)" >> "/tmp/tickets/${pasta::-1}-$(echo $line | cut -d ":" -f1).csv"
          fi
        fi
      done < "$pasta$file"
    done
  done
else
  echo "Só é possível introduzir um parâmetro."
fi

exit 0
