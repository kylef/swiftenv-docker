#!/usr/bin/env bash

set -e

if [ "$TRAVIS_BRANCH" == "master" ]; then
  docker login -u kylefci -p "$DOCKER_HUB_PASSWORD"
  make push
fi
