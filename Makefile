serve-client:
	(cd client && doppler run -- webdev serve -- --delete-conflicting-outputs)

build-client:
	(cd client && webdev build --output build)

serve-server:
	(cd server && yarn start-doppler)

release:
	docker build -t matthewnitschke/sonos-control .
	docker push matthewnitschke/sonos-control:latest