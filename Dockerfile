FROM alpine:3.18

RUN apk add --no-cache scryer-prolog --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/

COPY . .

RUN scryer-prolog main.pl