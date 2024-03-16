#!/bin/sh
set -eux

#--login-server https://hs.domain.tld \

sudo tailscale up \
    --reset \
    --accept-routes \
    --advertise-routes="$(cut -d';' -f1 /opt/tailscale/routes.csv | sed -e '/^#/d' -e '/^$/d' -e 's/, /,/g' | tr '\n' ',' | sed 's/,$//')"
