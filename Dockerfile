FROM keymetrics/pm2:10-alpine

RUN apk --no-cache add --virtual builds-deps build-base python

WORKDIR /app
COPY ringsteki-server .
RUN npm install --production
EXPOSE 4000
CMD [ "pm2-runtime", "ecosystem.config.js" ]