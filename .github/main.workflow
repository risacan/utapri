workflow "Sort and Commit" {
  resolves = ["commit"]
  on = "push"
}

action "when pull requests" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "not branch master"
}

action "sort" {
  uses = "docker://circleci/ruby:2.6.3-node-browsers-legacy"
  runs = "./scripts/sort.sh"
}

action "commit" {
  uses = "docker://circleci/ruby:2.6.3-node-browsers-legacy"
  needs = ["sort"]
  runs = "./scripts/commit.sh"
}
