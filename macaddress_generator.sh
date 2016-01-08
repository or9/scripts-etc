#!/bin/bash

# arguments
#echo $@
# number of arguments
#echo $#

function default {
	openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'

	exit $?
}

function setaddress {
	NEW_ADDRESS=`openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`

	echo "setting macaddress to $NEW_ADDRESS"

	sudo ifconfig en0 ether $NEW_ADDRESS

	exit $?
}

if [ -z "$1" ]; then
	default
else
	$1 $#
fi

exit $?
