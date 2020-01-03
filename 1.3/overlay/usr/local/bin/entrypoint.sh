#!/bin/sh
set -e

# set defaults
KEEPALIVED_CONF="/etc/keepalived/keepalived.conf"
KEEPALIVED_CONF_TPL="${KEEPALIVED_CONF}.tpl"
AUTH_PASSWORD="${AUTH_PASSWORD:-$(head -c 16 /dev/urandom | base64)}"

# checks
if [ "x$KEEPALIVED_VIP" == "x" ]; then
  echo "Error, no environment KEEPALIVED_VIP set, abort"
  exit 1;
fi
if [ "x$KEEPALIVED_INTERFACE" == "x" ]; then
  echo "Error, no environment KEEPALIVED_INTERFACE set, abort"
  exit 1;
fi

# create config from template
sed \
  -e "s#KEEPALIVED_VIP#$KEEPALIVED_VIP#g" \
  -e "s#KEEPALIVED_INTERFACE#$KEEPALIVED_INTERFACE#g" \
  -e "s#AUTH_PASSWORD#$AUTH_PASSWORD#g" \
  $KEEPALIVED_CONF_TPL > $KEEPALIVED_CONF

exec keepalived --vrrp --log-console --dont-fork --use-file=$KEEPALIVED_CONF
