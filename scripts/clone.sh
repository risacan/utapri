#!/bin/bash

set -eu

git_branch=${git symbolic-ref --short HEAD}
git_name=$(git log -1 --pretty=format:"%cn")
git_email=$(git log -1 --pretty=format:"%ce")

. .envrc

git clone \
  --depth 1 \
  --branch ${git_branch} \
  https://${PERSONAL_GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY} \

git push