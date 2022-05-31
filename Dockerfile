FROM node:16-alpine as builder
WORKDIR /var/app
COPY package.json /var/app/
RUN npm install
COPY . /var/app/
RUN npm run build

FROM nginx
COPY --from=builder /var/app/build /usr/share/nginx/html