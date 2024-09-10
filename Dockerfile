FROM node:18 AS base

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .





FROM base AS build

WORKDIR /usr/src/app

RUN npm test



FROM node:18-slim

WORKDIR /usr/src/app

# Copia las dependencias y el código de la etapa de construcción
COPY --from=build /usr/src/app/node_modules /app/node_modules
COPY --from=build /usr/src/app/package*.json /app/
COPY --from=build /usr/src/app/ .

EXPOSE 3000

CMD ["node","dist/index.js"]














