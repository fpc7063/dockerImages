#!/bin/bash
source ./variables.sh

docker build -t $TAG ../$TAG
if [[ $? == 1 ]]; then	
	IMAGE=`docker images | grep "<none>" | sed -E 's/\ +/\t/g' | cut -f3`
	echo -e "[DEBUG] Build process failed...\n Removing Image: $IMAGE"
	exit 1
fi

IMAGE=`docker images | grep $TAG | awk '{printf $3}' | cut -c1-12`
CONTAINER=`docker container create $IMAGE | cut -c 1-12`
echo -en "[DEBUG] Build Info:\nIMAGE: $IMAGE\nCONTAINER: "
docker start $CONTAINER && docker exec -it $CONTAINER /bin/bash

exit 0