FROM strapi/base

ENV  PORT 1337

# Create backend directory
RUN mkdir -p /usr/src/backend
WORKDIR /usr/src/backend

# Installing dependencies
COPY package*.json /usr/src/backend/
COPY ./yarn.lock ./
RUN yarn install

# Copying source files
COPY . /usr/src/backend
ENV NODE_ENV production
# Building backend
RUN yarn build
EXPOSE 1337

# Running the backend
CMD "yarn" "start"