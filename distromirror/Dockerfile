FROM alpine:3.10

RUN apk add --no-cache bash curl rsync nginx tini

COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir /run/nginx /tmp/nginx && chown nobody:nobody /run/nginx /tmp/nginx && ln -s /tmp/nginx /var/tmp/nginx

VOLUME /data
ENV BW_LIMIT=0
ENV ALPINE_BRANCHES=v3.10
ENV ALPINE_ARCHES=x86_64

RUN ln -s /usr/local/bin/sync.sh /etc/periodic/hourly/sync
COPY sync.sh entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]
