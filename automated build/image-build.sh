##!/bin/bash
TAG="aderbal"


docker build -t $TAG ..
IMAGE=`docker images | grep $TAG | awk '{printf $3}'`
CONTAINER=`docker container create $IMAGE | cut -c 1-12`
docker start $CONTAINER && docker exec -it $CONTAINER /bin/bash
