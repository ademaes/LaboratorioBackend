FROM node:lts-alpine
ENV NODE_ENV=production
# ip coneccion BD
ENV URL_DB_CONNECTION = 'mongodb://172.31.30.79:27017/bookstore'
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
RUN node createBook.js
EXPOSE 5000
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
