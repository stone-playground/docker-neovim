#!/bin/bash

set -e

export UBUNTU_IMAGE_NAME=anatolelucet/neovim:${TAG:-$TARGET}-ubuntu

docker buildx build --platform=linux/amd64,linux/arm64 -f ubuntu/Dockerfile --build-arg TARGET=${TARGET:-TAG} -t $UBUNTU_IMAGE_NAME .

docker login -u stonesun -p $PASSWORD

docker push $UBUNTU_IMAGE_NAME
