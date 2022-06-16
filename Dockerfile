FROM node:16

WORKDIR /home/node/app

# layers caching
COPY package*.json ./

RUN npm install

# copy all files that are not listed in .dockerignore
# layers caching
COPY . .

EXPOSE 5002

RUN apt-get update && \ 
  apt-get -y dist-upgrade && \
  apt-get install -y postgresql-client && \
  sh -c 'env' && \
  chmod 755 entrypoint.sh

VOLUME [ "/home/node/app/logs" ]

CMD [ "npm", "run", "build" ]
