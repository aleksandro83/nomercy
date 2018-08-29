#!/usr/bin/env bash

# Checkout master branch and merge version branch into master
git checkout nomercy0
git merge master --no-ff --no-edit
git push
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Success
echo "-------------------------------------------------------------------------"
echo "Merge master into $CURRENT_BRANCH complete"