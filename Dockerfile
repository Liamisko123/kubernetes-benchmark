FROM node:current-alpine

WORKDIR /app
COPY server.js .

EXPOSE 8080

CMD ["node", "server.js"]
