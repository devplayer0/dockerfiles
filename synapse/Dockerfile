FROM ananace/matrix-synapse:1.18.0

RUN apt-get update -qyy && apt-get install curl unzip -yqq
RUN curl -Lo /tmp/rest-provider.zip https://github.com/devplayer0/matrix-synapse-rest-password-provider/archive/master.zip
RUN cd /tmp && unzip rest-provider.zip
RUN cd /tmp/matrix-synapse-rest-password-provider-master && python setup.py install
