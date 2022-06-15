#!/bin/sh
docker build -t node-app .
docker run --rm -it -p 5002:5002 -v $PWD/logs:/home/node/app/logs  node-app
