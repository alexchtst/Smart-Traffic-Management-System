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
SimDir="Smart-Traffic-Management-DataSimulator"

FeBranch="main"
BeBranch="main"
AiBranch="main"
SimBranch="main"

pullService "$FeDir" "$FeBranch"
pullService "$BeDir" "$BeBranch"
pullService "$AiDir" "$AiBranch"
pullService "$SimDir" "$SimBranch"
