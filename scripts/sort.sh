#!/bin/bash

set -eu

gem install bundler
bundle

chmod +rw utapri.json
chmod +rw utapri.yml

exec ruby "./sort_json.rb" "$@"
