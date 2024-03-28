#!/bin/bash
TAG=$1
NAV=$2
cd /opt/prueba
./gradlew test -Dtag=$TAG -Dnav=$NAV
