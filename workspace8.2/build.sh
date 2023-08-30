#!/bin/sh

DIR=`cd "$(dirname "$0")" && pwd`

docker build --progress=plain --no-cache -t ghcr.io/gedgin/workspace:8.2 ${DIR}
docker push ghcr.io/gedgin/workspace:8.2
