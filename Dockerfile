FROM node:12.13-alpine

# Create app directory
RUN mkdir -p /usr/local/src/cloud-app
WORKDIR /usr/local/src/cloud-app

# Add .npmrc, package.json & yarn.lock
COPY .npmrc /usr/local/src/cloud-app/.npmrc
COPY package.json yarn.lock /usr/local/src/cloud-app/

# Install modules with yarn
RUN yarn

# Copy the code
COPY . /usr/local/src/cloud-app/

# Let's roll!
EXPOSE 3000
CMD [ "yarn", "start" ]
