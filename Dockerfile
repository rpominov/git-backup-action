
FROM alpine:latest

RUN apk add git openssh-client 

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]