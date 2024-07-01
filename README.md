# documentserver-nodejs-example-docker

Documentserver Nodejs Example Docker

## Setup

1. Replace `ENV DOCSERVER_NETWORK_NAME=''` in `Dockerfile` with
   your real ip (external, or local like `http://192.168.3.155`)
2. `docker compose build ds-test-example`
3. Edit `docker-compose.yml` to specify version of DocumentServer you want to setup
4. `docker compose up`
5. Open ip from step 1 in browser

>Please make sure not to use `http://localhost` on any steps,
it may cause `File Download` error and other troubles
