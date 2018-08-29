
# git-greenbranch.sh
#
# List the local branches that contain commits newer than a specific date
#
# Usage: git greenbranch <date>
#
# To make a Git alias called 'greenbranch' out of this script,
# put the latter on your search path, and run
#
#   git config --global alias.greenbranch '!sh git-greenbranch.sh'

if [ $# -ne 1 ]; then
  printf "usage: git greenbranch <date>\n\n"
  printf "For more details on the allowed formats for <date>, see the\n"
  printf "'git-log' man page.\n"
  exit 1
fi

testdate="$1"

git for-each-ref --sort=committerdate refs/remotes/ --format="%(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(*authorname) - (%(color:green)%(committerdate:short)%(color:reset)) - %(*contents:subject) - %(HEAD)" | \
  while read ref
  do
    if [ -n "$(git rev-list --max-count=1 --untill="$testdate" $ref)" ] 
    then
      printf "%s\n" "$ref"
    fi
  done

exit $?