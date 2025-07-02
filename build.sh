#!/bin/bash
echo "start building SetaSense Docker image 🚀"
docker cp ./main.c picc:/root/temporal
echo "👉 copied main.c to picc container"
docker exec -it picc /bin/bash -c "/opt/picc/ccsc +fm /root/temporal/main.c"
echo "👉 compiled main.c in picc container"
docker cp picc:/root/temporal/main.hex .
echo "👉 copied main.hex from picc container to host"
docker exec -it picc /bin/bash -c "rm -r /root/temporal/*"
echo "👉 cleaned up picc container"
echo "finish building SetaSense 🔥"
