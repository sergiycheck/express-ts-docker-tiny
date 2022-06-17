FROM node:16 as base

WORKDIR /home/node/app
COPY package*.json ./

FROM base as prod
RUN npm ci --production
COPY . .
EXPOSE 5002
RUN apt-get update && \ 
  apt-get -y dist-upgrade && \
  apt-get install -y postgresql-client && \
  sh -c 'env' && \
  chmod 755 entrypoint.sh
VOLUME [ "/home/node/app/logs" ]
CMD [ "npm", "run", "build" ]
