#!/bin/bash

echo "Número de parametros passados: $#"

echo "--------------------------------------"

ficheiro="Biblioteca.txt"

if [ -f $ficheiro ]
then
	echo "Ficheiro encontrado."
else
	echo "Ficheiro não encontrado."
fi

echo "--------------------------------------"

# IFS = internal field separator
while read -r line; do

	titulo=$(echo "$line" | cut -d "+" -f 1)
	autor=$(echo "$line" | cut -d "+" -f 2)
	categoria=$(echo "$line" | cut -d "+" -f 3)
	ano=$(echo "$line" | cut -d "+" -f 4)
	isbn=$(echo "$line" | cut -d "+" -f 5)

	if [ $((ano%2)) -eq 0 ]
	then
		if [ "$categoria" == "800" ]
		then
		#escrever pó ficheiro Log.txt
		echo "$line" > "Log.txt"
		fi
	fi

done < $ficheiro

echo "--------------------------------------"

exit
