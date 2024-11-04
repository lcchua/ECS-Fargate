FROM node:16-alpine
#FROM --platform=linux/amd64 node:16-alpine AS build
WORKDIR /my-app 
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD ["node", "index.js"]