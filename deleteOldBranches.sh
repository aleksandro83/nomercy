for k in $(git branch | sed /\*/d); do 
  if [ -z "$(git log -1 --before='2018-08-29 09:58:08 -0300' -s $k)" ]; then
    git branch -D $k
  fi
done