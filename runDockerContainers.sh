#!/bin/sh

appNetworkExists=$(docker network ls | grep web-app)

if [ -z "$appNetworkExists" ]; then
  >&1 echo "network web-app-network does not exist. Creating..."
  command docker network create web-app-network
  else
  >&1 echo "network web-app-network exists"
fi

# command docker build -t sergiycheck/node_app .

command docker run -d -p 5002:5002 \
--network web-app-network --name node_app1 \
-v "$PWD/logs:/home/node/app/logs" \
-e NODE_ENV=production \
-e PORT=5002 \
-e PG_DB_PORT=5432 \
-e PG_DB=dev \
-e PG_DB_HOST=postgress_db \
-e POSTGRES_PASSWORD=postgres \
-e POSTGRES_USER=postgres \
-e migrateDevArg=1 \
sergiycheck/node_app \
sh -c "./entrypoint.sh" \

command docker run -d \
--name postgress_db \
--network web-app-network --network-alias pg-net \
-v $PWD/pg-db-data:/var/lib/postgresql/data \
-p 5436:5432 \
-e POSTGRES_PASSWORD=postgres \
-e POSTGRES_USER=postgres \
-e POSTGRES_DB=dev \
postgres \
