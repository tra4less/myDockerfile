#!/bin/sh
if [ ! -d "/root/.docker/$DOMAIN" ]; then
    ruby certgen.rb $DOMAIN
fi
exec "$@"