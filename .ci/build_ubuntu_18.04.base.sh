#!/usr/bin/env bash
set -e

platform="linux/arm64,linux/amd64,linux/arm/v7"
docker buildx build \
  --no-cache \
  --push \
  --platform $platform \
  --tag ghcr.io/firezone/ubuntu:18.04 \
  --build-arg BASE_IMAGE="ubuntu:18.04" \
  --progress plain \
  -f pkg/Dockerfile.base.deb \
  .
