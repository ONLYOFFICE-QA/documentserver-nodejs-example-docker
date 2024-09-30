FROM node:20.16-bullseye

ENV DOCSERVER_NETWORK_NAME=''
ENV DOCS_PORT='8008'

ENV PORT=80

ARG BUILD_BRANCH=master

RUN git clone --depth=1 --recursive --shallow-submodules -b $BUILD_BRANCH https://github.com/ONLYOFFICE/document-server-integration.git
WORKDIR /document-server-integration/web/documentserver-example/nodejs/

RUN sed -i "s/\"enableForgotten\"\: false\,/\"enableForgotten\"\: true\,/" config/default.json

RUN sed -i "s/documentserver/$DOCSERVER_NETWORK_NAME:$DOCS_PORT/" config/default.json
RUN sed -i "s/\"port\".*,/\"port\"\: ${PORT},/" config/default.json

RUN npm install
ENV NODE_CONFIG_DIR="./config"

CMD ["node", "bin/www"]
