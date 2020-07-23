#!/bin/sh
echo "hi"
set -eu

echo ${GITHUB_REF##*/}

git_name=$(git log -1 --pretty=format:"%cn")
git_email=$(git log -1 --pretty=format:"%ce")
repository_name="https://${{ secrets.PERSONAL_GITHUB_TOKEN }}@github.com/${GITHUB_REPOSITORY}"

git config user.name ${git_name}
git config user.email ${git_email}

set +e

git diff --exit-code --quiet -- utapri.json
if [ 0 -ne $? ]; then
  git add utapri.json
  git commit -m ":shower: Sort utapri.json"
  git push ${repository_name}  ${GITHUB_REF##*/}
fi

git diff --exit-code --quiet -- utapri.yml
if [ 0 -ne $? ]; then
  git add utapri.yml
  git commit -m ":sparkles: Update yml with utapri.json"
  git push ${repository_name}  ${GITHUB_REF##*/}
fi
