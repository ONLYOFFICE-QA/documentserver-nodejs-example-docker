FROM ubuntu:18.04

ARG build_branch=master

RUN apt-get -y update && \
    apt-get -y --no-install-recommends install ca-certificates\ 
                                               git \
                                               npm \
                                               nodejs \
                                               wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*                                           
RUN git clone -b $build_branch https://github.com/ONLYOFFICE/document-server-integration.git
WORKDIR /document-server-integration/web/documentserver-example/nodejs/
RUN npm install
ENV NODE_CONFIG_DIR="./config"

COPY local.json config/local.json

CMD ["node", "bin/www"]
