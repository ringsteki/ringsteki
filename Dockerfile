FROM keymetrics/pm2:10-alpine

RUN apk --no-cache add --virtual builds-deps build-base python

ADD ringsteki-server/package.json /tmp/package.json
RUN cd /tmp && npm install --production
RUN mkdir -p /app && cp -a /tmp/node_modules /app/
WORKDIR /app
RUN mkdir -p /app/server/logs && chmod a+rwx /app/server/logs
COPY ringsteki-server .
RUN npm install --production
EXPOSE 4000
CMD [ "pm2-runtime", "ecosystem.config.js" ]