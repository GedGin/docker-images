#!/bin/sh

DIR=`cd "$(dirname "$0")" && pwd`

docker build --progress=plain --no-cache -t ghcr.io/gedgin/php:8.2-dev ${DIR}
docker push ghcr.io/gedgin/php:8.2-dev
