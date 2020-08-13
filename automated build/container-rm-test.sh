#!/bin/bash
TAG="python3-8-5"

IMAGE=`docker images | head -n2 | tail -n1 | awk '{printf $3}' | cut -c 1-12`
CONTAINER=`docker container list -a | grep $IMAGE | cut -c 1-12`
echo "[DEBUG] Found C: $CONTAINER"
docker stop $CONTAINER
docker rm $CONTAINER


NEW_CONTAINER=`docker container create $IMAGE | cut -c 1-12`
docker start $NEW_CONTAINER && docker exec -it $NEW_CONTAINER /bin/bash