workflow "Sort and Commit" {
  resolves = ["commit"]
  on = "pull_request"
}

action "when pull requests" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "not branch master"
}

action "clone" {
  uses = "docker://ruby:2.7.0-preview1"
  needs = ["when pull requests"]
  runs = "./scripts/clone"
  env = {
    TARGET_REPOSITORY = "risacan/utapri"
  }
  secrets = ["PERSONAL_GITHUB_TOKEN"]
}

action "sort" {
  uses = "docker://ruby:2.7.0-preview1"
  needs = ["clone"]
  runs = "./scripts/sort"
}

action "commit" {
  uses = "docker://ruby:2.7.0-preview1"
  needs = ["sort"]
  runs = "./scripts/commit"
}
