const SpotifyWebApi = require('spotify-web-api-node');

const toMils = require('to-mils');

const { spotifyClientId, spotifyClientSecret, spotifyUserId } = require('../environment.js');

const express = require("express");
const router = express.Router();

const { getServerAddress, loadSpotifyTokens, saveSpotifyTokens, getAverageColor } = require('../utils.js')
const redirect_uri = `http://${getServerAddress()}:3000/spotify/auth-redirect`;
console.log(`Spotify redirect_uri: ${redirect_uri}`);

const spotifyApi = new SpotifyWebApi({
  clientId: spotifyClientId,
  clientSecret: spotifyClientSecret,
  redirectUri: redirect_uri,
});

module.exports = (io) => {
  // ------------------------- Authorization -------------------------

  let isSpotifyAuthenticated = false;
  loadSpotifyTokens()
    .then((tokens) => {
      console.log("Tokens found")
      
      let { accessToken, refreshToken, expiresInDate } = tokens;

      let expiresIn = (expiresInDate - new Date()) / 60; // in seconds
      if (expiresIn <= 0) {
        console.log('Could not refresh spotify access token. Reason: saved tokens are outside of refresh range')
      } else {
        authorizeSpotify(accessToken, refreshToken, expiresIn);
        isSpotifyAuthenticated = true;
      }
    })
    .catch((e) => console.log(`Could not refresh spotify access token. Reason: ${e.message}`));

  router.get('/is-authorized', (req, res) => {
    res.send(isSpotifyAuthenticated);
  })
  
  router.get('/login', (req, res) => {
    if (
      spotifyClientId == null ||
      spotifyClientSecret == null
    ) {
      res.status(400).send("Missing spotify env vars")
    }
  
    let scopes = [
      "user-read-private", 
      "user-read-playback-state",
      "user-modify-playback-state",
      "user-read-email", 
      "playlist-read-private",
    ].join(" ");
    res.redirect(
      "https://accounts.spotify.com/authorize" +
        "?response_type=code" +
        "&client_id=" +
        spotifyClientId +
        (scopes ? "&scope=" + encodeURIComponent(scopes) : "") +
        "&redirect_uri=" +
        encodeURIComponent(redirect_uri)
    );
  });
  
  router.get('/auth-redirect', async (req, res) => {
    let { code } = req.query;
  
    try {
      let data = await spotifyApi.authorizationCodeGrant(code)
  
      let { access_token, refresh_token, expires_in } = data.body
  
      console.log(`Access Token: ${access_token}`);
      console.log(`Refresh Token: ${refresh_token}`);
  
      await saveSpotifyTokens(access_token, refresh_token, expires_in);
  
      authorizeSpotify(access_token, refresh_token, expires_in)
      isSpotifyAuthenticated = true;
  
      res.status(200).send(`Spotify Authorized for next ${expires_in/60} minutes. Will refresh token when that happens`);
    } catch(e) {
      console.error(e);
      res.status(400).send(`Something went wrong: ${e.message}`)
    }
  });

  function authorizeSpotify(accessToken, refreshToken, expiresIn) {
    spotifyApi.setAccessToken(accessToken);
    spotifyApi.setRefreshToken(refreshToken);

    setRefreshTimeout(expiresIn);
  }

  function setRefreshTimeout(expiresIn) {
    setTimeout(async () => {
      try {
        let resp = await spotifyApi.refreshAccessToken();
        setRefreshTimeout(resp.expires_in)
      } catch (e) {
        console.error('Unable to re-authorize spotify', e)
        isSpotifyAuthenticated = false;
      }
    }, toMils(`${expiresIn}sec`));
  }

  // ------------------------- One time calls -------------------------

  router.get('/devices', async (req, res) => {
    try {
      let myDevices = await spotifyApi.getMyDevices();
    
      console.log(myDevices.body.devices);
    
      res.json(myDevices);
    } catch(e) {
      res.status(400).send(e);
    }
  });

  router.get('/connect', async (req, res) => {
    try {
      await spotifyApi.transferMyPlayback({
        device_ids: []
      });
    
      console.log(myDevices.body.devices);
    
      res.json(myDevices);
    } catch(e) {
      res.status(400).send(e);
    }
  });

  router.get('/play', async (req, res) => {
    try {
      await spotifyApi.play();
    
      res.status(200).send('Playing');
    } catch(e) {
      res.status(400).send(e);
    }
  });

  // ------------------------- socket connections -------------------------

  function registerSpotifyEvent(socketEventName, runner) {
    let lastCall;
    setInterval(async () => {
      if (isSpotifyAuthenticated) {
        newCall = await runner();

        if (JSON.stringify(lastCall) === JSON.stringify(newCall)) return;
        
        lastCall = newCall;

        io.emit(socketEventName, lastCall);
      }
    }, toMils('1sec'));

    io.on('connection', (socket) => {
      if (lastCall) {
        socket.emit(socketEventName, lastCall);
      }
    })
  };

  registerSpotifyEvent('spotify-playing-track-change', async () => {
    let resp = await spotifyApi.getMyCurrentPlayingTrack();

    if (Object.keys(resp.body).length == 0) {
      return { connected: false };
    };

    let albumArtworkUrl = resp.body.item.album.images[0].url;
    return {
      connected: true,
      trackName: resp.body.item.name,
      artistName: resp.body.item.artists.map((artist) => artist.name).join(','),
      albumArtworkUrl: albumArtworkUrl,
      albumArtworkAverageColor: await getAverageColor(albumArtworkUrl),
    }
  });

  registerSpotifyEvent('spotify-playback-state-change', async () => {
    let resp = await spotifyApi.getMyCurrentPlaybackState();

    if (Object.keys(resp.body).length == 0) return { connected: false };

    return {
      connected: true,
      isPlaying: resp.body.is_playing,
      volume: resp.body.device.volume_percent
    }
  });

  return router;
}

// async function getMyPlaylists() {
//   let myId = (await spotifyApi.getMe()).id;
    
//   let playlists = await spotifyApi.getUserPlaylists(myId);

//   playlists = playlists.body.items.map((playlist) => {
//     let parts = playlist.uri.split(':')
//     let id = parts[parts.length-1]
//     let correctedURI = `spotify:user:${spotifyUserId}:playlist:${id}`

//     return {
//       name: playlist.name,
//       uri: correctedURI
//     }
//   })

//   return playlists
// }