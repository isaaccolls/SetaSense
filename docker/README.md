# commands

- build image: `docker build -t setasense/picc .`
- run container: `docker run -dti --name picc setasense/picc`
- container access: `docker exec -it picc /bin/bash`
  - checks architecture: `dpkg --print-architecture` and `dpkg --print-foreign-architectures`
  - ldd < 2.27: `ldd --version`
- stop container: `docker stop picc`
- delete container: `docker rm picc`

## Installation steps inside container:

1. Run the installer: `./pcml.run`
2. Copy registration file: `cp ~/installer/pcm.crg /opt/picc/`
3. Test compiler: `./ccsc +V`
4. create directory for project building: `mkdir temporal`
