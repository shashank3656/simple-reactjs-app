FROM node:14.17.5-alpine as react
USER root
RUN mkdir -p /usr/app
WORKDIR /usr/app
COPY . /usr/app
RUN npm cache clean --force
RUN npm install --silent
RUN npm install react-scripts@1.1.1 -g --silent
RUN npm install --save react react-dom react-scripts
RUN npm run build


FROM nginx:1.13.9-alpine
COPY --from=react /usr/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
