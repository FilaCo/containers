#!/bin/bash
cp $NGINX_PROXY_MANAGER_HOME/letsencrypt/live/npm-1/fullchain.pem /home/filaco/Projects/containers/mailcow-dockerized/data/assets/ssl/cert.pem
cp $NGINX_PROXY_MANAGER_HOME/letsencrypt/live/npm-1/privkey.pem /home/filaco/Projects/containers/mailcow-dockerized/data/assets/ssl/key.pem
postfix_c=$(docker ps -qaf name=postfix-mailcow)
dovecot_c=$(docker ps -qaf name=dovecot-mailcow)
nginx_c=$(docker ps -qaf name=nginx-mailcow)
docker restart ${postfix_c} ${dovecot_c} ${nginx_c}
