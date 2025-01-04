#!usr/bin/env bash

status=$(git status -s)

if [ ! -z "$status" ]; then
    diff="$(git diff)"
    if [ ! -z "$diff" ]; then
        git diff | bat
    else
        git status | bat
    fi
    read -e -p "message: " message
    read -e -p "Confirm Push (Y|n):- " confirm

    if [[ "$confirm" == "y" ]] || [[ "$confirm" == "Y" ]] || [[ "$confirm" == "" ]]; then
        git add . && \
        git commit -m "$message" -m "$(git diff --stat)" && \
        if [[ -z $1 ]]; then
            git push -u origin main
        else
            git push -u origin ${1}
        fi
    else
        echo "CANCELING THE GIT PUSH PROCESS..."
    fi
else
    echo -e "\e[31mNOTHING TO COMMIT.\e[0m"
fi
exit

