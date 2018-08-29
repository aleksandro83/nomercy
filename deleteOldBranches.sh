for k in $(git branch | sed /\*/d); do 
  if [ -n "$(git log -1 --before='2018/08/24 02:48' -s $k)" ]; then
    git branch -D $k
  fi
done