# Install node.js v6.10 LTS
FROM node:boron

# Create app directory
RUN mkdir -p /usr/src/app

# Switch to app directory
WORKDIR /usr/src/app

# Install app dependencies
RUN npm install

# Open port
EXPOSE 3000

CMD [ "npm", "start" ]

