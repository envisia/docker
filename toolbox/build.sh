#!/bin/sh

docker build -t docker.envisia.io/envisia/toolbox:$1 .
docker push docker.envisia.io/envisia/toolbox:$1
