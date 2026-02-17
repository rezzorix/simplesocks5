#!/bin/sh
set -eu

: "${PROXY_USER:?PROXY_USER not set}"
: "${PROXY_PASSWORD:?PROXY_PASSWORD not set}"

mkdir -p /etc/3proxy

cat > /etc/3proxy/3proxy.cfg <<EOF
nscache 65536
auth strong
users ${PROXY_USER}:CL:${PROXY_PASSWORD}
allow ${PROXY_USER}
socks -p1080
flush
EOF

exec 3proxy /etc/3proxy/3proxy.cfg
