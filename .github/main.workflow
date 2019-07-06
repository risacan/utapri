workflow "New workflow" {
  on = "push"
  resolves = ["docker://ruby:2.6.3"]
}

action "docker://ruby:2.6.3" {
  uses = "docker://ruby:2.6.3"
  runs = "ruby"
  args = "sort_json.rb"
}
