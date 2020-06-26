FROM google/dart:2.7 as builder

WORKDIR /app/
ADD pubspec.yaml /app
RUN pub get

RUN pub run build_runner build --delete-conflicting-outputs --release -o build

FROM nginx
## Replace the default nginx index page with our Angular app
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/build /usr/share/nginx/html

COPY ./.nginx/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]