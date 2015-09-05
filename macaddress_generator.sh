#!/bin/bash

# arguments
#echo $@
# number of arguments
#echo $#

function default {
	openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'

	exit $?
}

if [ -z "$1" ]; then
	default
fi

exit $?
