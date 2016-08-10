#!/bin/bash

pid=$!

spin=('-' '\\' '|' '/')

echo -n "Building ${spin[0]}"

while [ kill -0 $pid ]; do
	for i in "$spin[@]"; do
		echo -ne "\b$i"
		sleep 0.5
	done
done
