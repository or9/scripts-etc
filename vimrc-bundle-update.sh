#!/bin/sh

find . -type d -name .git \
	| xargs -n 1 dirname \
	| sort \
	| while read line; do echo $line && cd $line && git pull && git submodule update --init --recursive && cd ..; done

exit $?
