#!/bin/bash

#create a user through script

read -p "Enter a username: " username

echo "you entered $username"

sudo useradd -m $username

echo "New User added"
