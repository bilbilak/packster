#!/usr/bin/env zsh

set -e

npm install --prefix "${INPUT_ACTION}/source"
node "${INPUT_ACTION}/source/index.js"
