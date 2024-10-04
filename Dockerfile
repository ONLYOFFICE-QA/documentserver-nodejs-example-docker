FROM node:20.16-bullseye

ENV DOCSERVER_NETWORK_NAME=''
ENV DOCS_PORT='8008'
ENV PORT=80

ARG BUILD_BRANCH=master

RUN git clone --depth=1 --recursive --shallow-submodules -b $BUILD_BRANCH https://github.com/ONLYOFFICE/document-server-integration.git
WORKDIR /document-server-integration/web/documentserver-example/nodejs/

RUN apt-get update && apt-get install -y jq moreutils

RUN jq '.server.enableForgotten = true' config/default.json | sponge config/default.json && \
    jq '.server.maxFileSize = 107374182400' config/default.json | sponge config/default.json && \
    jq --arg name "$DOCSERVER_NETWORK_NAME" \
       --arg port "$DOCS_PORT" \
       '.server.siteUrl = "http://" + $name + ":" + $port + "/"' config/default.json | sponge config/default.json && \
    jq --arg port "$PORT" '.server.port = $port' config/default.json | sponge config/default.json && \
    jq '.server.maxFileSize = 107374182400' config/production-linux.json | sponge config/production-linux.json

RUN npm install
ENV NODE_CONFIG_DIR="./config"

CMD ["node", "bin/www"]
