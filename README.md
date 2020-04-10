# documentserver-nodejs-example-docker

Documentserver Nodejs Example Docker

```bash
BUILD_BRANCH=master && \
ufw disable && \
docker build --build-arg build_branch=$BUILD_BRANCH -t documentserver-nodejs-example documentserver-nodejs-example-docker && \
docker run -itd -p 8008:8008 -p 80:80 -v /opt/onlyoffice/Data:/var/www/onlyoffice/Data documentserver-nodejs-example

```
