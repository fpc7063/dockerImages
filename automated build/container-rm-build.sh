#!/bin/bash
TAG="python3-8-5"

IMAGE=`docker images | head -n2 | tail -n1 | awk '{printf $3}' | cut -c 1-12`
CONTAINER=`docker container list -a | grep $IMAGE | cut -c 1-12`
echo "[DEBUG] Found C: $CONTAINER"
docker stop $CONTAINER
docker rm $CONTAINER


docker build -t $TAG ..
if [[ $? == 1 ]]; then	
	IMAGE=`docker images | grep "<none>" | sed -E 's/\ +/\t/g' | cut -f3`
	echo -e "[DEBUG] Build process failed...\n Removing Image: $IMAGE"
	docker rmi -f "$IMAGE"
	exit 1
fi

IMAGE=`docker images | grep $TAG | awk '{printf $3}'`
CONTAINER=`docker container create $IMAGE | cut -c 1-12`
docker start $CONTAINER && docker exec -it $CONTAINER /bin/bash