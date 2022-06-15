FROM node:16

WORKDIR /home/node/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 5002

RUN apt-get update && \ 
  apt-get -y dist-upgrade && \
  apt-get install -y postgresql-client && \
  sh -c 'env' && \
  chmod 755 entrypoint.sh

CMD [ "npm", "run", "build" ]
