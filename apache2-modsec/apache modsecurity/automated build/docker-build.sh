##!/bin/bash
TAG="apache2-modsec"


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
