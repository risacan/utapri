#!/bin/bash

set -eu

gem install bundler
bundle

exec ruby "./sort_json.rb" "$@"
