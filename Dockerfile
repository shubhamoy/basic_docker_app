# Install node.js Alpine
FROM node:alpine

# Switch to app directory
WORKDIR /srv

# Bundle App Source
COPY . /srv

# Install PM2 Globally
RUN npm install pm2 -g

# Start app with PM2
CMD ["pm2-docker", "start", "npm", "--", "start"]

# Open port
EXPOSE 3000