#!/bin/bash
TAG="mariadb"

IMAGE=`docker images | head -n2 | tail -n1 | awk '{printf $3}' | cut -c 1-12`
CONTAINER=`docker container list -a | grep $IMAGE | cut -c 1-12`
echo "[DEBUG] Found C: $CONTAINER"
docker stop $CONTAINER
docker rm $CONTAINER

exit 0