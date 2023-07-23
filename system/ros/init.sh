#!/bin/bash
DOCKER_NAME=cub/ros:foxy
export DOCKER_NAME
docker image build --rm -t $DOCKER_NAME .
