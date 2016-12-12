#!/usr/bin/env bash

set -e

if [ "$TRAVIS_BRANCH" == "master" ]; then
  docker login --username kylefci --password "$DOCKER_HUB_PASSWORD"
  make push
fi
