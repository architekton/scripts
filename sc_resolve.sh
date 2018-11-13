#!/usr/bin/env sh

if [ -z "$1" ]; then
	echo "Missing argument."
	exit 1
fi

#Resolve to an ip
dig +short "$1" |
grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' |
head -1
