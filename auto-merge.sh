#!/bin/sh
# Automatically merge the last commit in master to automaticMergeTest

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
LAST_COMMIT=$(git rev-list -1 HEAD)

echo Automatically merging commit $LAST_COMMIT from $CURRENT_BRANCH rippling to automaticMergeTest

git checkout nomercy0
git merge master
git checkout $CURRENT_BRANCH