#!/usr/bin/env bash

function fgetWiki(){
	url="$1"
	d1="${url##*//}"
	d1="${d1%%/*}"
	d2=$(echo -n "$d1"|sed -e 's/^www.//')

	wget \
		--recursive \
		--no-clobber \
		--page-requisites \
		--html-extension \
		--convert-links \
		--restrict-file-names=windows \
		--domains $d2 \
		--no-parent "$url"
}

if [ $# != 1 ]; then
	echo -e "help: $0 url\n\n"
	exit
fi

fgetWiki "$1"
