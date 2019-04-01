FROM node:10
WORKDIR /usr/src/app
# Copy package.json and package-lock.json if it exists
COPY package*.json ./
# Install package
RUN npm install
# Copy app source
COPY . .

EXPOSE 9093
CMD [ "npm", "start" ]