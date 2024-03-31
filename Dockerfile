FROM nginx:1.25.4

COPY default.conf.template /etc/nginx/conf.d/
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]