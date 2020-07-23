#!/bin/sh

set -eu

git config user.name "$(git log -1 --pretty=format:"%cn")"
git config user.email "git log -1 --pretty=format:"%ce""

echo "${{ github.event.pull_request.head.ref }}"

set +e

git diff --exit-code --quiet -- utapri.json
if [ 0 -ne $? ]; then
  git add utapri.json
  git commit -m ":shower: Sort utapri.json"
  git push "https://${{ secrets.PERSONAL_GITHUB_TOKEN }}@github.com/${GITHUB_REPOSITORY}" $GITHUB_REF
fi

git diff --exit-code --quiet -- utapri.yml
if [ 0 -ne $? ]; then
  git add utapri.yml
  git commit -m ":sparkles: Update yml with utapri.yml"
  echo $GITHUB_REF
  git push "https://${{ secrets.PERSONAL_GITHUB_TOKEN }}@github.com/${GITHUB_REPOSITORY}" $GITHUB_REF
fi
