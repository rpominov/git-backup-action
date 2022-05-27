
FROM alpine:latest

LABEL "com.github.actions.name"="Git repo backup Action"
LABEL "com.github.actions.description"="Backup your git repo into another one"
LABEL "com.github.actions.icon"="home"
LABEL "com.github.actions.color"="red"

LABEL "repository"="https://github.com/rpominov/git-backup-actions"
LABEL "homepage"="https://github.com/rpominov/git-backup-actions"
LABEL "maintainer"="Roman <rpominov@gmail.com>"

LABEL "Name"="Git repo backup Action"
LABEL "Version"="0.0.1"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apk add --no-cache git openssh-client 

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]