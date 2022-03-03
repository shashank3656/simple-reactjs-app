FROM node:14.17.5-alpine
USER root
RUN mkdir -p /usr/app
WORKDIR /usr/app
COPY . /usr/app
RUN npm cache clean --force
RUN npm install --save react react-dom react-scripts
RUN npm run build
EXPOSE 3000
CMD "npm" "run" "dev"
