FROM node:14.17.5

ENV  PORT 1337

# Create backend directory
RUN mkdir -p /usr/src/backend
WORKDIR /usr/src/backend

# Installing dependencies
COPY package*.json /usr/src/backend/
RUN npm install

# Copying source files
COPY . /usr/src/backend

# Building backend
RUN npm run build
EXPOSE 1337

# Running the backend
CMD "npm" "strapi" "start"