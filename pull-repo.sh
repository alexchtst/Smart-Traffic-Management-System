#!/bin/bash

pullService(){

    echo "into directory $1 ..."
    echo "cd $1"

    echo "checkout repo into $2 ..."
    echo "git checkout $2"

    echo "pull from repo $1 in branch $2 ..."
    echo "git pull"
}

Fe="git@github.com:alexchtst-01/Smart-Traffic-Management-Fronteend.git"
FeBranch="main"

Be="git@github.com:alexchtst-01/Smart-Traffic-Management-Backend.git"
BeBranch="main"

Ai="git@github.com:alexchtst-01/Smart-Traffic-Management-AI.git"
AiBranch="main"

pullService $Fe, $FeBranch
pullService $Be, $BeBranch
pullService $Ai, $AiBranch