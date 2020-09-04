const SpotifyWebApi = require('spotify-web-api-node');

const { spotifyClientId, spotifyClientSecret, spotifyUserId } = require('../environment.js');

const express = require("express");
const router = express.Router();

const ipAddress = require('../utils.js').getServerAddress()
const redirect_uri = `http://${ipAddress}:3000/spotify/auth-redirect`;

const spotifyApi = new SpotifyWebApi({
  clientId: spotifyClientId,
  clientSecret: spotifyClientSecret,
  redirectUri: redirect_uri,
});


router.get("/login", (req, res) => {
  if (
    spotifyClientId == null ||
    spotifyClientSecret == null
  ) {
    res.status(400).send("Missing spotify env vars")
  }

  let scopes = "user-read-private user-read-email playlist-read-private";
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

    let { access_token, refresh_token } = data.body
    spotifyApi.setAccessToken(access_token);
    spotifyApi.setRefreshToken(refresh_token);

    res.status(200).send("Spotify Authorized");
  } catch(e) {
    console.error(e.message);
    res.status(400).send(`Something went wrong: ${e.message}`)
  }
});

async function getMyPlaylists() {
  let myId = (await spotifyApi.getMe()).id;
    
  let playlists = await spotifyApi.getUserPlaylists(myId);

  playlists = playlists.body.items.map((playlist) => {
    let parts = playlist.uri.split(':')
    let id = parts[parts.length-1]
    let correctedURI = `spotify:user:${spotifyUserId}:playlist:${id}`

    return {
      name: playlist.name,
      uri: correctedURI
    }
  })

  return playlists
}


module.exports = {
  router,
  getMyPlaylists
}