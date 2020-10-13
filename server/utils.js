const fs = require('fs');

const ip = require('ip')
const rgbHex = require('rgb-hex');

const { createCanvas, loadImage } = require('canvas');
const FastAverageColor = require('fast-average-color');
const fac = new FastAverageColor();


const spotifyRefreshTokenPath = '.spotify-tokens.json';

module.exports = {
    getServerAddress: () => {
        if (process.env.NODE_ENV === 'development') {
            return 'localhost'
        }
        return ip.address()
    },
    getAverageColor: async (fileURI) => {
        const img = await loadImage(fileURI);
        const { width, height } = img;
      
        const canvas = createCanvas(width, height);
        const ctx = canvas.getContext('2d');
        ctx.drawImage(img, 0, 0);
      
        const imageData = ctx.getImageData(0, 0, width, height);
        
        const size = 20;

        // console.log(`Filename: ${fileURI}, size: ${width}×${height}`);
        // console.log('// [red, green, blue, opacity]');
        // console.log('Simple average color: ', fac.getColorFromArray4(imageData.data,  { algorithm: 'simple'}));
        // console.log('Sqrt average color: ', fac.getColorFromArray4(imageData.data));
        // console.log('Dominant average color: ', fac.getColorFromArray4(imageData.data, { algorithm: 'dominant'}));

        const color = fac.getColorFromArray4(imageData.data, { 
            algorithm: 'dominant',
            left: imageData.width - size
        })

        return rgbHex(color[0], color[1], color[2])
    },
    loadSpotifyTokens: () => {
        return new Promise((res, rej) => {
            if (fs.existsSync(spotifyRefreshTokenPath)) {
                let tokens = require(`./${spotifyRefreshTokenPath}`);

                tokens.expiresInDate = new Date(tokens.expiresInDate)

                res(tokens);
            } else {
                throw new Error('Token file missing');
            }
        });
    },
    saveSpotifyTokens: (accessToken, refreshToken, expiresIn) => {
        return new Promise((res, rej) => {
            try {
                let expiresInDate = new Date();
                expiresInDate.setSeconds(expiresIn);
                
                let data = JSON.stringify({
                    accessToken,
                    refreshToken,
                    expiresInDate: expiresInDate.toISOString(),
                })
                console.log(data);
                fs.writeFile(spotifyRefreshTokenPath, data, {}, res);
            } catch(e) {
                rej(e)
            }
        });
    }
}