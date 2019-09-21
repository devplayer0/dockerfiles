FROM alpine:3.10

RUN apk add --no-cache bash rsync mailcap darkhttpd tini

VOLUME /data
ENV BW_LIMIT=0

RUN ln -s /usr/local/bin/sync.sh /etc/periodic/hourly/sync
COPY sync.sh entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]
