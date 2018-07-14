#!/bin/sh

if [ -n "$(which pacman 2> /dev/null)" ]; then
	if [ -z "$(pacman -Q bind-tools 2> /dev/null)" ]; then
		sudo pacman -S bind-tools
		echo "Re-run this script."
		exit 0
	fi
fi

if [ -z "$1" ]; then
	echo "Missing argument."
	exit 1
fi

#Resolve to an ip
dig +short "$1" | 
grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' |
head -1
