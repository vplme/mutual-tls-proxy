#!/usr/bin/env bash

echo "Replacing environment variables"
envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"