FROM node:14

RUN npm install -g @angular/cli@12.1.1 

WORKDIR /frontend

COPY package.json .

RUN npm install

COPY . .
CMD ng serve --host 0.0.0.0 --port 8081

