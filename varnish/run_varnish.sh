#!/bin/bash
sed -i "s/<BACKEND_HOST>/$BACKEND_HOST/g;s/<BACKEND_PORT>/$BACKEND_PORT/g" /app/varnish.vcl
/usr/sbin/varnishd -a "0.0.0.0:9000" -f "/app/varnish.vcl" \
     -F -n "/app" -s "malloc,30G" -p "http_resp_size=10000000" \
     -p "http_req_size=1000000" -p "http_resp_hdr_len=1000000" \
     -p "http_req_hdr_len=1000000"
