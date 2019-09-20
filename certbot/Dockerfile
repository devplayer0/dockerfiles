FROM certbot/dns-cloudflare

COPY requirements.txt /tmp/
RUN apk --no-cache add musl-dev gcc make && \
    pip uninstall -y enum34 && \
    pip install -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt && \
    apk --no-cache del musl-dev gcc make

COPY config.json /etc/letsencrypt/certbotd.json
COPY certbotd /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/certbotd"]
