#!/bin/sh

DIR=`cd "$(dirname "$0")" && pwd`

docker build --progress=plain --no-cache -t ghcr.io/gedgin/php:8.1 ${DIR}
docker push ghcr.io/gedgin/php:8.1
