FROM node:14.21.3-buster

ENV DOCS_ADDRESS=''
ENV DOCS_PORT='8008'

ENV PORT=80

ARG BUILD_BRANCH=release/v1.9.0

RUN git clone --depth=1 --recursive --shallow-submodules -b $BUILD_BRANCH https://github.com/ONLYOFFICE/document-server-integration.git
WORKDIR /document-server-integration/web/documentserver-example/nodejs/

RUN sed -i "s/documentserver/$DOCS_ADDRESS:$DOCS_PORT/" config/default.json
RUN sed -i "s/\"port\".*,/\"port\"\: ${PORT},/" config/default.json

RUN npm install
ENV NODE_CONFIG_DIR="./config"

CMD ["node", "bin/www"]
