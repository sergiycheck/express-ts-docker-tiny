#!/bin/sh

pgNetExists=$(docker network ls | grep web-app)

if [ -z "$pgNetExists" ]; then
  >&1 echo "network web-app-network does not exist. Creating..."
  command docker network create web-app-network
  else
  >&1 echo "network web-app-network exists"
fi

command docker run --rm -it \
--name some-postgres-dev \
--network web-app-network --network-alias pg-net \
-v $PWD/pg-db-data:/var/lib/postgresql/data \
-p 5436:5432 \
-e POSTGRES_PASSWORD=postgres \
-e POSTGRES_USER=postgres \
postgres