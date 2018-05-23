# documentserver-nodejs-example-docker
Documentserver Nodejs Example Docker

# How to start with documentserver
_**Attention**_: Your server should have real IP address accessible from Internet.
Do not use inside corporate network with NAT.

```
BUILD_BRANCH=master && \
ufw disable && \
EXTERNAL_IP=$(curl ipinfo.io/ip) && \
git clone https://github.com/onlyoffice-testing-robot/documentserver-nodejs-example-docker.git && \
sed -i -- 's/external_ip/'"$EXTERNAL_IP"'/g' documentserver-nodejs-example-docker/local.json && \
docker build --build-arg build_branch=$BUILD_BRANCH -t documentserver-nodejs-example documentserver-nodejs-example-docker && \
docker run -itd -p 8080:80 onlyoffice/documentserver && \
docker run -itd -p 80:80 documentserver-nodejs-example

```
