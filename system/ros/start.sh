#!/bin/bash
docker run --privileged --rm -it \
	--user=$UNAME \
	--env="DISPLAY" \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	-v ${PWD}/ws:/cub \
	$DOCKER_NAME