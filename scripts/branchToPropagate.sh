#!/bin/bash

# filter only "release/" branches
# remove "release/" from the brach names
# Sort as number and remove multilines
releaseBranches=$(git branch -r | grep 'release/' | tr -d 'origin/release/' | sort -n | xargs)
echo $releaseBranches

eval "git branch -r"

# Replace " " by ","
releaseBranches=$( echo ${releaseBranches// /","})

echo $releaseBranches

# get first param and remove "origin/release/"
currentVersion=$(echo $1 | tr -d 'origin/release/')

echo $currentVersion

# Remove frist part of branch string 
branchesToMerge=$( echo $releaseBranches | grep -oP "$currentVersion.*")

# Remove current version from string
branchesToMerge=$(echo ${branchesToMerge//$currentVersion/})

# add "release/" for each version
branchesToMerge=$( echo ${branchesToMerge//,/",release/"})

# Concat with master
branchesToMerge=$branchesToMerge",master"

# remove the first caracter of string (,)
branchesToMerge=${branchesToMerge#?}

echo $branchesToMerge

echo "::set-output name=BRANCHES_TO_MERGE::$branchesToMerge"