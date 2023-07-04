#!/bin/bash
DOCKER_NAME=cub/ros:humble
export DOCKER_NAME
docker image build --rm -t $DOCKER_NAME .
