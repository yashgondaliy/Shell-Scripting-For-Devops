#!/bin/bash

<<info 
this is help to try catch problem
info

create_directory() {
	mkdir demo
}

if ! create_directory; then
	echo "folder is already created"
	exit 1
fi

echo "this shoud not work because the code is interrupted"
