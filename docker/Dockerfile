FROM debian:stretch

# Configurar variables de entorno para evitar prompts interactivos
ENV DEBIAN_FRONTEND=noninteractive

# Configurar repositorios e instalar dependencias
RUN <<EOF
echo "deb http://archive.debian.org/debian/ stretch main" >/etc/apt/sources.list
echo "deb-src http://archive.debian.org/debian/ stretch main" >>/etc/apt/sources.list
echo "deb http://archive.debian.org/debian-security stretch/updates main" >>/etc/apt/sources.list
echo "deb-src http://archive.debian.org/debian-security stretch/updates main" >>/etc/apt/sources.list
dpkg --add-architecture i386
apt-get update --allow-unauthenticated
apt-get install -y --allow-unauthenticated libc6:i386 libstdc++6:i386 libncurses5:i386 multiarch-support
rm -rf /var/lib/apt/lists/*
EOF

# Establecer directorio de trabajo
WORKDIR /opt/picc

# Comando por defecto para mantener el contenedor corriendo
CMD ["/bin/bash"]
