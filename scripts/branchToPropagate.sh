#!/bin/bash

# filter only "release/" branches
# remove "release/" from the brach names
# Sort as number and remove multilines
eval "releaseBranches=$(ls | grep 'release-' | tr -d 'release-' | sort -n | tr '\n' ',')"

# echo $releaseBranches

# get first param and remove "origin/release/"
currentVersion=$(echo $1 | tr -d 'origin/release-')

# echo $currentVersion

# Remove frist part of branch string 
branchesToMerge=$( echo $releaseBranches | grep -oP "$currentVersion.*")

# Remove current version from string
branchesToMerge=$(echo ${branchesToMerge//$currentVersion/})

# Remove last caracter of the branch string
branchesToMerge=${branchesToMerge::-1}

# add "release/" for each version
branchesToMerge=$( echo ${branchesToMerge//,/",release/"})

# Concat with master
branchesToMerge=$branchesToMerge",master"

# remove the first caracter of string (,)
branchesToMerge=${branchesToMerge#?}

echo $branchesToMerge

echo "::set-output name=BRANCHES_TO_MERGE::$branchesToMerge"