FROM alpine:3

RUN apk add rsync openssh

COPY entrypoint.sh /

ENTRYPOINT /entrypoint.sh
