#!/bin/sh

set -eu

git_name=$(git log -1 --pretty=format:"%cn")
git_email=$(git log -1 --pretty=format:"%ce")
branch_name=$(git symbolic-ref --short HEAD)
repository_name="https://${PERSONAL_GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}"

git config user.name ${git_name}
git config user.email ${git_email}

set +e

git diff --exit-code --quiet -- utapri.json
if [ 0 -ne $? ]; then
  git add utapri.json
  git commit -m ":shower: Sort utapri.json"
  git push ${repository_name} ${branch_name}
fi

git diff --exit-code --quiet -- utapri.yml
if [ 0 -ne $? ]; then
  git add utapri.yml
  git commit -m ":sparkles: Update yml with utapri.json"
  git push ${repository_name} ${branch_name}
fi
