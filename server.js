const http = require('http');
const os = require('os');

const port = 8080;
const podName = process.env.HOSTNAME || "Neznámy Pod";

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');

  const responseText = `
    <h1>Ahoj z Edge!</h1>
    <p>Aktuálne ti odpovedá Pod: <b>${podName}</b></p>
    <p>Moja interná IP: <b>${os.networkInterfaces().eth0?.[0].address || 'unknown'}</b></p>
    <hr>
    <small>Bežím na Node.js verzii: ${process.version}</small>
  `;

  res.end(responseText);
});

server.listen(port, '0.0.0.0', () => {
  console.log(`Server beží na porte ${port}`);
});
