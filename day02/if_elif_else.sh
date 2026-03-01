#!/bin/bash

<<info 
it help to learn if statement
info
read -p "jetha ne mud k kya dekha: " bandi

if [[ $bandi == daya ]] then
	echo "jetha is loyal"
elif [[ $bandi != daya ]] then
	read -p "how much you love% $bandi  " pyar
	if [[ pyar -ge 100 ]] then
		echo "jetha is loyal"
	else
		echo "jetha is not loyal"
	fi
fi

