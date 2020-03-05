FROM onlyoffice/documentserver-ie

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"
ARG build_branch=master

RUN apt-get -y update && \
    apt-get -y install git
RUN git clone -b $build_branch https://github.com/ONLYOFFICE/document-server-integration.git
COPY local.json /document-server-integration/web/documentserver-example/nodejs/config/local.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
