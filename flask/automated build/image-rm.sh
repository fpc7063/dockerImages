#!/bin/bash
TAG="python3-8-5"

IMAGE=`docker images | grep $TAG | awk '{printf $3}' | cut -c 1-12`
CONTAINER=`docker container list -a | grep $IMAGE | cut -c 1-12`
echo "[DEBUG] Found C: $CONTAINER I: $IMAGE"
docker stop $CONTAINER
docker rm $CONTAINER
docker rmi $IMAGE