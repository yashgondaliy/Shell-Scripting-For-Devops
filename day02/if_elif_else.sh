#!/bin/bash

<<info 
it help to learn if statement
info

read -p "jetha ne mud k kya dekha: " bandi
#read -p "jetha ka pyaar %: " pyaar

if [[ $bandi == daya ]];
then
	echo "jetha is loyal"

#read -p "jetha ka pyaar %: " pyaar
elif [[ $pyaar -ge 100 ]];
read -p "jetha ka pyaar %: " pyaar
then
	echo "jetha is loyal"
else
	echo "jetha is not loyal"
fi
