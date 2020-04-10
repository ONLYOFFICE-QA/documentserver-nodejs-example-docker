FROM ubuntu:18.04

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"
ARG build_branch=master

RUN apt-get -y update && \
    apt-get -y install git npm nodejs
RUN git clone -b $build_branch https://github.com/ONLYOFFICE/document-server-integration.git
WORKDIR /document-server-integration/web/documentserver-example/nodejs/
COPY local.json config/local.json
RUN npm install

CMD NODE_CONFIG_DIR='./config' node bin/www