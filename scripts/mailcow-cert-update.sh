#!/bin/bash
cp /home/filaco/containers/letsencrypt/live/npm-4/fullchain.pem /home/filaco/containers/mailcow-dockerized/data/assets/ssl/cert.pem
cp /home/filaco/containers/letsencrypt/live/npm-4/privkey.pem /home/filaco/containers/mailcow-dockerized/data/assets/ssl/key.pem
postfix_c=$(docker ps -qaf name=postfix-mailcow)
dovecot_c=$(docker ps -qaf name=dovecot-mailcow)
nginx_c=$(docker ps -qaf name=nginx-mailcow)
docker restart ${postfix_c} ${dovecot_c} ${nginx_c}