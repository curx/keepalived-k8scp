FROM alpine:latest
RUN apk -U add keepalived
COPY scripts/keepalived.conf.tpl /etc/keepalived/
COPY scripts/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
CMD ["haproxy" "-f" "/usr/local/etc/haproxy/haproxy.cfg"]
ENTRYPOINT ["docker-entrypoint.sh"]  
