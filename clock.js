const http = require('http');

const ACCESS_URL = `http://${process.env.AWAKE_ACCESS_DOMAIN}`;
const INTERVAL_MSEC = 10 * 60 * 1000;

setInterval(() => {
  http
    .get(ACCESS_URL, res => {
      console.log(res.statusCode, res.statusMessage, ACCESS_URL);
    })
    .on('error', err => {
      console.log(err, ACCESS_URL);
    });
}, INTERVAL_MSEC);
