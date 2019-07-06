#!/bin/bash
set -eu

cd utapri

git_name=$(git log -1 --pretty=format:"%cn")
git_email=$(git log -1 --pretty=format:"%ce")

git config user.name ${git_name}
git config user.email ${git_email}


if git diff utapri.json >/dev/null ; then
  git add utapri.json
  git commit -m ":shower: Sort utapri.json"
fi

if git diff utapri.yml  >/dev/null ; then
  git add utapri.yml
  git commit -m ":sparkles: Update yml with utapri.json"
fi

