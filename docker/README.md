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

## Sincronización de drivers

Después de instalar el compilador CCS en el contenedor, los drivers estarán disponibles en `/opt/picc/drivers/`.

Para sincronizar los drivers al proyecto local (necesario para IntelliSense en Cursor/VS Code):

```bash
# Desde la raíz del proyecto
./sync-drivers.sh
```

O simplemente ejecuta `./build.sh` y los drivers se sincronizarán automáticamente si no existen.
