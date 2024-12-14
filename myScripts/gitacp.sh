#!usr/bin/env bash

status=$(git status -s)

if [ ! -z "$status" ]; then
    diff="$(git diff)"
    if [ ! -z "$diff" ]; then
        echo "$diff" | bat
    else
        git status | bat
    fi
    read -e -p "message: " message
    read -e -p "Confirm (Y|n):- " confirm

    if [[ "$confirm" == "y" ]] || [[ "$confirm" == "Y" ]] || [[ "$confirm" == "" ]]; then
        git add . && status=$(git status -s) && git commit -m "$message" -m "$status" && git push -u origin main
    else
        echo "Git push process has been cancelled."
        echo "See Ya..."
    fi

else
    echo "Nothing to commit." | bat
fi
exit
