#!/bin/bash

#this is for and while loop

for (( i=$2; i<=$3; i++ ))
do
	mkdir "$1$i" 
done

echo "complete successfully"
