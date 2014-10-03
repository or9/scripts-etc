#!/bin/sh

# Example filesystem:
# ~/.vimrc/bundle/YouCompleteMe
#	…nerdtree
#	…molokai
#	…clang_complete
#	…vim-airline
# 
# Usage (assuming this file's name is update.sh)
# cd ~/.vimrc/bundle
# ./update.sh

find . -type d -name .git \
	| xargs -n 1 dirname \
	| sort \
	| while read line; do echo $line && cd $line && git pull && git submodule update --init --recursive && cd ..; done

exit $?
