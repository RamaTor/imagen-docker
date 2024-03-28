#!/bin/bash
RAMA=$1
REPOSITORIO=$2
mkdir -p /opt/prueba-framework

#Clona repositorio git
git clone -b $RAMA $REPOSITORIO /opt/prueba-framework
chmod 755 /opt/prueba
cd /opt/prueba/
