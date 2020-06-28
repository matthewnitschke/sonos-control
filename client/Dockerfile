FROM google/dart:2.8 as builder

WORKDIR /app/
ADD client/pubspec.yaml .
ADD client/pubspec.lock .
RUN pub get


ADD client/build.yaml .
ADD client/lib ./lib
ADD client/web ./web

RUN pub run build_runner build --delete-conflicting-outputs --release -o build

FROM nginx

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=client_builder /app/build /etc/nginx/html

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]