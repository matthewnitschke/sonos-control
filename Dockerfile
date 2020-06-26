# FROM google/dart:2.7

# WORKDIR /client/
# ADD client/pubspec.yaml /client
# RUN pub get

# Build step? how to generate js code?

FROM node

WORKDIR /server/
ADD server/package.json /server
ADD server/yarn.lock /server
RUN yarn install

ADD server server

CMD ["yarn", "start"]

