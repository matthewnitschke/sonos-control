const { spotifyClientId, spotifyClientSecret, spotifyUserId } = require('./environment.js');

const SpotifyWebApi = require('spotify-web-api-node');

const spotifyApi = new SpotifyWebApi({
  clientId : spotifyClientId,
  clientSecret : spotifyClientSecret
});

async function setupAuth() {
    let data = await spotifyApi.clientCredentialsGrant()
    console.log(data)
    spotifyApi.setAccessToken(data.body['access_token']);
}

async function getUserPlaylists(){
  try {
    await setupAuth()
    return spotifyApi.getUserPlaylists(spotifyUserId)
  } catch(e) {
    console.log(e)
  }
}


module.exports = {
  getUserPlaylists
}