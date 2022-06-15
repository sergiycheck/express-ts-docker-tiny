FROM node:16

WORKDIR /home/node/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 5002

RUN apt-get update && \ 
  apt-get -y dist-upgrade && \
  sh -c 'env' && \
  npm run build

CMD [ "npm", "run", "start:prod" ]
