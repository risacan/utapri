#!/bin/sh
set -eu

git_name=$(git log -1 --pretty=format:"%cn")
git_email=$(git log -1 --pretty=format:"%ce")

git config --local user.name ${git_name}
git config --local user.email ${git_email}

git diff  --exit-code --quiet -- utapri.json
if [ 0 -ne $? ]; then
    git add utapri.json
  git commit -m ":shower: Sort utapri.json"
  git push
fi

git diff  --exit-code --quiet -- utapri.yml
if [ 0 -ne $? ]; then
  git add utapri.yml
  git commit -m ":sparkles: Update yml with utapri.json"
  git push
fi
