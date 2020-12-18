FROM node:12-buster

ARG build_branch=master
                                        
RUN git clone -b $build_branch https://github.com/ONLYOFFICE/document-server-integration.git
WORKDIR /document-server-integration/web/documentserver-example/nodejs/
RUN npm install
ENV NODE_CONFIG_DIR="./config"

COPY local.json config/local.json

CMD ["node", "bin/www"]
