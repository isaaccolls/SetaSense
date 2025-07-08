#!/bin/bash
echo "start building SetaSense Docker image 🚀"
docker exec -it picc /bin/bash -c "rm -rf /root/temporal"
echo "👉 cleaned up picc container 1"
docker exec -it picc /bin/bash -c "mkdir -p /root/temporal"
docker cp ./main.c picc:/root/temporal
echo "👉 copied main.c to picc container"
docker exec -it picc /bin/bash -c "/opt/picc/ccsc +fm /root/temporal/main.c"
echo "👉 compiled main.c in picc container 🤘"
rm -rf ./build/*
docker cp picc:/root/temporal/. ./build/
echo "👉 copied files from picc container to host"
docker exec -it picc /bin/bash -c "rm -rf /root/temporal"
echo "👉 cleaned up picc container 2"
echo "finish building SetaSense 🔥"
