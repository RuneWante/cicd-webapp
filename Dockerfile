FROM alpine:3.19

WORKDIR /app

ENV NODE_VERSION 20.17.0

EXPOSE 3000/tcp
COPY ./package.json ./yarn.lock /app/


RUN apk update && apk add --no-cache yarn


RUN apk add --no-cache curl

RUN yarn install --frozen-lockfile

COPY ./ /app/

CMD ["yarn", "start"]