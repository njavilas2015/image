#!/bin/bash

set -e 

echo "Generando configuraciones de Nginx desde clients.yml..."
/docker-entrypoint.d/generate_nginx_configs.sh

echo "Iniciando Nginx..."
exec nginx -g "daemon off;"
