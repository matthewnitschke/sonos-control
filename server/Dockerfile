FROM node

WORKDIR /app/
ADD package.json /app
ADD yarn.lock /app
RUN yarn install

ADD . .

CMD ["yarn", "start"]
