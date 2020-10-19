#!/bin/bash
source ./variables.sh

#Vai ser alterado ainda, por enquanto solucao tapa buraco
echo "[DEBUG] Limpando ambiente..."
docker images | grep "<none>" | awk '{print $3 "\n"}' | xargs docker rmi -f


IMAGE=`docker images | grep $TAG | awk '{printf $3}' | cut -c 1-12`
CONTAINER=`docker container list -a | grep $IMAGE | cut -c 1-12`
echo "[DEBUG] Found C: $CONTAINER I: $IMAGE"
docker stop $CONTAINER
docker rm $CONTAINER
docker rmi $IMAGE
