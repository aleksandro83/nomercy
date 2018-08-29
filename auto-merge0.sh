#!/usr/bin/env bash

# Get version argument and verify

# version=$1
# if [ -z "$version" ]; then
#   echo "Please specify a version"
#   exit
# fi

# # Output
# echo "Releasing version $version"
# echo "-------------------------------------------------------------------------"

 # Get current branch and checkout if needed
#  branch=$(git symbolic-ref --short -q HEAD)
#  if [ "$branch" != master ]; then
#    git checkout master
#  fi

# # Ensure working directory in version branch clean
# git update-index -q --refresh
# if ! git diff-index --quiet HEAD --; then
#   echo "Working directory not clean, please commit your changes first"
#   exit
# fi

# Checkout master branch and merge version branch into master
git checkout nomercy0
git merge master --no-ff --no-edit

# Run version script, creating a version tag, and push commit and tags to remote
npm version nomercy0
git push

# # Checkout dev branch and merge master into dev (to ensure we have the version)
# git checkout dev
# git merge master --no-ff --no-edit
# git push

# # Delete version branch locally and on remote
# git branch -D $version
# git push origin --delete $version

# Success
echo "-------------------------------------------------------------------------"
echo "Release $version complete"