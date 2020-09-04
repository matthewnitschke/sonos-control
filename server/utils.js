const ip = require('ip')

module.exports = {
    getServerAddress: () => {
        if (process.env.NODE_ENV === 'development') {
            return 'localhost'
        }
        return ip.address()
    }
}