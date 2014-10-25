#!/bin/bash

#echo "1 is... $1 the file to download"
aria2c --on-download-complete=exit --check-integrity=true --file-allocation=falloc --max-concurrent-downloads=8 --continue=true --max-connection-per-server=8 --bt-enable-lpd=true --bt-max-peers=0 $1

exit $?
