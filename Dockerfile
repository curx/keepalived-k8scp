FROM alpine:3.8

RUN apk -U add keepalived

COPY scripts/keepalived.conf.tpl /etc/keepalived/
COPY scripts/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]  
