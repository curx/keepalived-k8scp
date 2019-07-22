FROM alpine:3.10

RUN apk --no-cache -U add keepalived

COPY scripts/keepalived.conf.tpl /etc/keepalived/
COPY scripts/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]  
