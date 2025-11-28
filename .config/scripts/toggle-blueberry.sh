#!/bin/bash

if pgrep -x "blueberry" > /dev/null; then
    pkill -x "blueberry"
else
	blueberry
fi

