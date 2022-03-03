FROM node:14.17.5-alpine
USER root
RUN mkdir -p /usr/app
WORKDIR /usr/app
COPY . /usr/app
RUN npm install -g 
RUN npm run build
EXPOSE 3000
CMD "npm" "run" "dev"
