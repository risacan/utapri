#!/bin/bash

set -eu

cd utapri
exec ruby "./sort_json.rb" "$@"
