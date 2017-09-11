FROM ubuntu:16.04

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"
ARG build_branch=master

RUN apt-get update && apt-get install -y git-core curl sudo
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get update && apt-get -y install nodejs
RUN git clone -b $build_branch https://github.com/ONLYOFFICE/document-server-integration.git
COPY local.json /document-server-integration/web/documentserver-example/nodejs/config/local.json
EXPOSE 80
CMD (/document-server-integration/web/documentserver-example/nodejs/run-mac.command &) && \
    bash
