const SpotifyWebApi = require('spotify-web-api-node');

const { spotifyClientId, spotifyClientSecret, spotifyUserId } = require('../environment.js');

const express = require("express");
const router = express.Router();
const redirect_uri = "http://localhost:3000/spotify/auth-redirect";

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

  let scopes = "user-read-private user-read-email";
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

router.get('/playlists', async (req, res) => {
  try {
    let myId = (await spotifyApi.getMe()).id;
    
    let playlists = await spotifyApi.getUserPlaylists(myId);

    res.json(playlists)
  } catch(e) {
    console.error(e.message)

    res.status(400).send(`Something went wrong: ${e.message}`)
  }
})

module.exports = router