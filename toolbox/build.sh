#!/bin/sh

docker build -t envisia/toolbox:$1 .
docker push envisia/toolbox:$1
