#!/bin/bash
# Script para sincronizar drivers desde el contenedor Docker

if ! docker ps -a --format '{{.Names}}' | grep -q "^picc$"; then
  echo "❌ El contenedor 'picc' no existe. Por favor, crea el contenedor primero."
  echo "   Ejecuta: docker run -dti --name picc setasense/picc"
  exit 1
fi

if ! docker ps --format '{{.Names}}' | grep -q "^picc$"; then
  echo "⚠️  El contenedor 'picc' está detenido. Iniciándolo..."
  docker start picc
  sleep 2
fi

echo "🔄 Sincronizando drivers desde el contenedor Docker..."
if docker exec picc test -d /opt/picc/drivers; then
  docker cp picc:/opt/picc/drivers ./drivers
  echo "✅ Drivers sincronizados exitosamente en ./drivers/"
else
  echo "❌ No se encontró la carpeta drivers en el contenedor"
  echo "   Asegúrate de que el compilador CCS esté instalado en el contenedor"
  exit 1
fi

