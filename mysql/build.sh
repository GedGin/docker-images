#!/bin/sh

DIR=`cd "$(dirname "$0")" && pwd`

docker build --progress=plain --no-cache -t ghcr.io/gedgin/mysql:5.7 ${DIR}
docker push ghcr.io/gedgin/mysql:5.7
