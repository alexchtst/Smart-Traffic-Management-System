#!/bin/bash

pullService(){
    dir="$1"
    branch="$2"

    echo "Masuk ke directory $dir ..."
    cd "$dir" || { echo "Gagal masuk ke $dir"; exit 1; }

    echo "Checkout ke branch $branch ..."
    git checkout "$branch"

    echo "Pull dari branch $branch ..."
    git pull

    cd - > /dev/null
}

FeDir="Smart-Traffic-Management-Frontend"
BeDir="Smart-Traffic-Management-Backend"
AiDir="Smart-Traffic-Management-AI"

FeBranch="main"
BeBranch="main"
AiBranch="main"

pullService "$FeDir" "$FeBranch"
pullService "$BeDir" "$BeBranch"
pullService "$AiDir" "$AiBranch"
