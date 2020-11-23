FROM node:latest-alpine

WORKDIR /app
COPY . /app

RUN apk update && apk add git
RUN npm install -g firebase-tools 

RUN chmod +x /app/distributeApp.sh
ENTRYPOINT [ "/app/distributeApp.sh" ]