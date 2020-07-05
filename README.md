![Release](https://github.com/matthewnitschke/sonos-control/workflows/Release/badge.svg)

# sonos-control
Dedicated media controls for sonos

![image](https://user-images.githubusercontent.com/6363089/85253126-bbbb8700-b41a-11ea-9431-138c373e7fb0.png)

## Usage
Sonos-control is designed to be run on a docker server and raspberry pi touch screen client

### Server Installation

```
docker run \
   -p 3000:3000 \
   --net="host" \
   --env MAIN_DEVICE_NAME=Office \ # the name of your sonos room
   matthewnitschke/sonos-control 
```

### Client Installation

Currently I am just booting a chromium window in `kiosk` mode on raspberry pi boot. The site is served on port `3000` so the default url should be:

```
http://<your server ip>:3000
``` 

Ill probably improve this at a later date

## Env
Here is a list of the possible environment variables. Spotify env var are optional, but required if you want sonos-control to be able to select / play music from spotify
- `SPOTIFY_CLIENT_ID` - spotify api client id
- `SPOTIFY_CLIENT_SECRET` - spotify api client secret
- `SPOTIFY_USER_ID` - your users spotify id
- `MAIN_DEVICE_NAME` - the sonos room name that this device lives in