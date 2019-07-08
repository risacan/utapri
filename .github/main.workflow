workflow "Sort and Commit" {
  on = "push"
  resolves = ["commit"]
}

action "sort" {
    needs = ["not branch master"]
  uses = "docker://ruby:2.7.0-preview1"
  runs = "./scripts/sort.sh"
}

action "commit" {
  uses = "docker://alpine/git:latest"
  needs = ["sort"]
  runs = "./scripts/commit.sh"
  secrets = ["PERSONAL_GITHUB_TOKEN"]
}

action "not branch master" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "not branch master"
}
