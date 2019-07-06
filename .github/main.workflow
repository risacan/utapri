workflow "Sort and Commit" {
  resolves = ["commit"]
  on = "pull_request"
}

action "when pull requests" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "not branch master"
}

action "clone" {
  uses = "sort"
  needs = ["when pull requests"]
  runs = "./scripts/clone"
  env = {
    GITHUB_REPOSITORY = "risacan/utapri"
  }
  secrets = ["PERSONAL_GITHUB_TOKEN"]
}

action "sort" {
  uses = "sort"
  needs = ["clone"]
  runs = "./scripts/sort"
}

action "commit" {
  uses = "commit"
  needs = ["sort"]
  runs = "./scripts/commit"
}
