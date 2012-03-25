#!/bin/bash

tflag=
lflag=
dflag=

while [ $# -gt 0 ]
do
	case "$1" in
		-t)	tflag=on
			manga=$2
			lastChapter=$3
			shift
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

if [ tflag ]
then
	code=`curl -s -L -w %{http_code} -o /dev/null www.mangareader.net/$manga`
	
	if [ $code == "404" ]
	then
		echo "Manga : \"$manga\" not found. Are u sure it exists in the mangareader database?"
		exit 1
	fi

	if ! [ -f mangas ]
	then
		touch mangas
	fi

	echo $manga >> mangas

fi