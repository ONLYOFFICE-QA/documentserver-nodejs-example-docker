/document-server-integration/web/documentserver-example/nodejs/run-mac.command &
/app/ds/run-document-server.sh &
sleep 30
sed -i 's/80/8008/g' /etc/onlyoffice/documentserver/nginx/ds.conf
service nginx restart
tail -f /var/log/onlyoffice/**/*.log
