#!/bin/sh

#connect to pg db
#command docker exec -it some-postgres-dev psql -U postgres

# use container which ships with a lot of tools that are useful 
# for troubleshooting or debugging networking issues.
# link https://github.com/nicolaka/netshoot
# command docker run -it --network web-app-network nicolaka/netshoot

#run & build docker-compose dev
# exec docker-compose -f docker-compose.dev.yml up --build

#run & build docker-compose prod
# exec docker-compose up --build

#clean
# exec docker-compose down --volumes

