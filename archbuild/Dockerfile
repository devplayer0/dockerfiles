FROM base/archlinux:latest

COPY base-setup.sh /tmp/
RUN /tmp/base-setup.sh

USER build
ENV PATH="${PATH}:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
ENV USER=build
WORKDIR /build
COPY user-setup.sh /build/
RUN /build/user-setup.sh

WORKDIR /build/user
