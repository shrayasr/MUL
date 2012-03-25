#!/bin/bash

tflag=off
lflag=off
dflag=off

while [ $# -gt 0 ]
do
	case "$1" in
		-t)	tflag=on
			manga=$2
			lastChapter=$3
			shift
			shift
			break;;
		-l) lflag=on;;
		-d)	dflag=on
			manga=$2
			shift
			break;;
	esac

	shift
done