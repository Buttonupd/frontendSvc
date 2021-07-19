FROM node:14 as build-stage

WORKDIR  /frontend
copy package*.json /frontend/
RUN npm install
copy ./ /app/

RUN npm run build  
FROM nginx:1.15

COPY --from=build-stage /frontend/dist/out /usr/share/nginx/html
COPY ./nginx-custom.conf /etc/nginx/conf.d/default.conf

