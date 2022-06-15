#!/bin/sh

command docker run -it -p 5004:5004 \
-w /home/node/app -v "$PWD:/home/node/app" \
node:16 \
sh -c "npm install && export PORT=5004 && \
      npm run start:dev"
