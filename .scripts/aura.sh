#!/usr/bin/env bash

show=false
quiet=false
recursive=false
deps=""

# Parse with GNU getopt
parsed=$(getopt -o sqrd: -l show,quiet,recursive,deps: -- "$@")
if [[ $? -ne 0 ]]; then
    exit 1
fi

eval set -- "$parsed"

while true; do
    case "$1" in
        -s|--show) show=true; shift ;;
        -q|--quiet) quiet=true; shift ;;
        -r|--recursive) recursive=true; shift ;;
        -d|--deps) deps="$2"; shift 2 ;;
        --) shift; break ;;
        *) break ;;
    esac
done

args=("$@")

echo "show      = $show"
echo "quiet     = $quiet"
echo "recursive = $recursive"
echo "deps      = $deps"
echo "args      = ${args[*]}"


