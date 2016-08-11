#!/bin/bash

# run some command & 2>/dev/null &
#java -jar jenkins-cli.jar -s <url of Jenkins instance> build <project> -s
#java -jar jenkins-cli.jar -s <url of Jenkins instance> build <project> -f
# should return 0 or non 0 for success / fail
pid=$!

spin=('-' '\\' '|' '/')

echo -n "Building ${spin[0]}"

while [ kill -0 $pid ]; do
	for i in "$spin[@]"; do
		echo -ne "\b$i"
		sleep 0.5
	done
done
