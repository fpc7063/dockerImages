#!/bin/bash
TAG="apache2-modsec"

IMAGE=`docker images | grep $TAG | awk '{printf $3}' | cut -c 1-12`
CONTAINER=`docker container list -a | grep $IMAGE | cut -c 1-12`
echo "[DEBUG] Found C: $CONTAINER"
docker stop $CONTAINER
docker rm $CONTAINER