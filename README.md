![Release](https://github.com/matthewnitschke/sonos-control/workflows/Release/badge.svg)

# sonos-control
Dedicated media controls for sonos

![image](https://user-images.githubusercontent.com/6363089/85253126-bbbb8700-b41a-11ea-9431-138c373e7fb0.png)


## Env
- `SPOTIFY_CLIENT_ID` - spotify api client id
- `SPOTIFY_CLIENT_SECRET` - spotify api client secret
- `SPOTIFY_USER_ID` - your users spotify id
- `MAIN_DEVICE_NAME` - the sonos room name that this device lives in


```
docker build -t sonos-control .
docker run -p 3000:3000 --net="host" sonos-control
```
