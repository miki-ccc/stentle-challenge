FROM node:12.16.2-alpine AS build

RUN apk add --no-cache python make g++

WORKDIR /data/app
COPY *.json ./
RUN npm ci

COPY *.html ./
COPY *.js ./
COPY *.css ./
COPY src ./src
RUN npm run build

FROM nginx:1.16.1-alpine
COPY --from=build /data/app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
