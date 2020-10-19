FROM node:latest
RUN apt update && apt upgrade -y

WORKDIR /usr/src/app

COPY ./* ./
RUN npm install

ENTRYPOINT ["node"]
