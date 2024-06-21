#!/usr/bin/env bash

set -e

if [ -n "$INPUT_USERNAME" ];then
	echo "$INPUT_PASSWORD" | docker login "$INPUT_REGISTRY" -u "$INPUT_USERNAME" --password-stdin
fi

exec docker run "$INPUT_IMAGE" \
	-v "/var/run/docker.sock:/var/run/docker.sock" \
	-v "${GITHUB_WORKSPACE}:/workspace" \
	--entrypoint="$INPUT_SHELL" \
	-c "${INPUT_RUN//$'\n'/;}"
