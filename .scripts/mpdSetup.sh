#!/bin/bash

if ! command -v mpd > /dev/null; then
	echo "mpd not installed"
	exit 1
fi

mkdir -p ~/.mpd/playlists/
touch ~/.mpd/database
touch ~/.mpd/log
touch ~/.mpd/pid
touch ~/.mpd/state
touch ~/.mpd/sticker.sql

echo done
