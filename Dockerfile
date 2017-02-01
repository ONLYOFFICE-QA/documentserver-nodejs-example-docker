FROM ubuntu:16.04

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

RUN apt-get update && apt-get install -y git-core curl sudo
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN git clone https://github.com/ONLYOFFICE/document-server-integration.git
COPY local.json /document-server-integration/web/documentserver-example/nodejs/config/local.json
EXPOSE 80
CMD (/document-server-integration/web/documentserver-example/nodejs/run-mac.command &) && \
    bash
