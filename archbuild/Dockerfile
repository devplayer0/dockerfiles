FROM base/archlinux:latest

COPY base-setup.sh /tmp/
RUN /tmp/base-setup.sh

USER build
COPY user-setup.sh /build/
RUN /build/user-setup.sh
