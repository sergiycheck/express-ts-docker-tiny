#!/bin/sh

#connect to pg db
# command docker exec -it some-postgres-dev psql -U postgres

# use container which ships with a lot of tools that are useful 
# for troubleshooting or debugging networking issues.
# link https://github.com/nicolaka/netshoot
command docker run -it --network web-app-network nicolaka/netshoot