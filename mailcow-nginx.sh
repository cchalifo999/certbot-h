#!/bin/bash
cp /etc/letsencrypt/live/cchalifo.xyz/fullchain.pem /opt/mailcow-dockerized/data/assets/ssl/cert.pem
cp /etc/letsencrypt/live/cchalifo.xyz/privkey.pem /opt/mailcow-dockerized/data/assets/ssl/key.pem
postfix_c=$(docker ps -qaf name=postfix-mailcow)
dovecot_c=$(docker ps -qaf name=dovecot-mailcow)
nginx_c=$(docker ps -qaf name=nginx-mailcow)
docker restart ${postfix_c} ${dovecot_c} ${nginx_c}
#nginx -s
systemctl reload nginx
#systemctl reload apache2
