workflow "Docker Builder" {
  on = "push"
  resolves = ["push"]
}

action "login" {
  uses = "actions/docker/login@master"
  secrets = [
    "DOCKER_PASSWORD",
    "DOCKER_USERNAME",
  ]
}

action "build" {
  uses = "actions/docker/cli@master"
  args = "build -t matthewnitschke/sonos-control ."
}

action "push" {
  uses = "actions/docker/cli@master"
  needs = ["login", "build"]
  args = "push matthewnitschke/sonos-control:latest"
}