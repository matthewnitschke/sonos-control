# Client build step
# FROM google/dart:2.8 as client_builder
FROM isaacp/dart-arm:arm64 as client_builder
WORKDIR /app/
ADD client/pubspec.yaml .
ADD client/pubspec.lock .
RUN pub get


ADD client/build.yaml .
ADD client/lib ./lib
ADD client/web ./web

RUN pub run build_runner build --delete-conflicting-outputs --release -o build

# Server build step
FROM node

COPY --from=client_builder /app/build /app

WORKDIR /app/
ADD server/package.json .
ADD server/yarn.lock .
RUN yarn install

ADD server .

CMD ["yarn", "start"]