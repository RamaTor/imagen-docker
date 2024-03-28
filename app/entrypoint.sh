#!/bin/bash
git clone -b main $REPO_DOCKER $WORKSPACE
docker buildx build -t $NOMBRE_APELLIDO:$TAG_IMAGEN .
chmod +x $WORKSPACE/app/*
sh clone.sh $RAMA $REPOSITORIO
docker run -e RAMA=$RAMA -e REPOSITORIO=$REPOSITORIO -e TAG=$TAG -e NAV=$NAV $NOMBRE_APELLIDO:$TAG_IMAGEN

CI=true dive $NOMBRE_APELLIDO:$TAG_IMAGEN > log.txt
cat log.txt

docker run --rm -i hadolint/hadolint:latest < Dockerfile > logfile.txt || true
cat logfile.txt

trivy image $NOMBRE_APELLIDO:$TAG_IMAGEN > trivy.txt
cat trivy.txt
docker rmi -f $NOMBRE_APELLIDO:$TAG_IMAGEN
docker rmi -f hadolint/hadolint
