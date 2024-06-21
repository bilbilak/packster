#!/usr/bin/env bash

set -e

npm install --prefix "${INPUT_ACTION}/source"
node "${INPUT_ACTION}/source/index.js"
