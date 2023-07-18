FROM node:18.12-slim AS base

RUN apt-get update
RUN apt-get install -y openssl

WORKDIR /app
COPY package-lock.json package.json ./
RUN npm ci
COPY . .
RUN npm run build

RUN chown -R node:node /app
USER node
CMD ["npm", "run", "start:dev"]
