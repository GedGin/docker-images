#!/bin/sh

DIR=`cd "$(dirname "$0")" && pwd`

docker build --progress=plain --no-cache -t ghcr.io/gedgin/node:22 ${DIR}
docker push ghcr.io/gedgin/node:22
