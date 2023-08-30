#!/bin/sh

DIR=`cd "$(dirname "$0")" && pwd`

docker build --progress=plain --no-cache -t ghcr.io/gedgin/apache:latest ${DIR}
docker push ghcr.io/gedgin/apache:latest
