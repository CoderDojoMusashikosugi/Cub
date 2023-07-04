#!/bin/bash
DOCKER_NAME=cub/ros-sys:humble
export DOCKER_NAME
docker image build --rm -t $DOCKER_NAME .
