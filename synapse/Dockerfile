FROM ananace/matrix-synapse:latest

RUN wget -O $(python -c "import site; print(site.getsitepackages()[0])")/rest_auth_provider.py https://raw.githubusercontent.com/ma1uta/matrix-synapse-rest-password-provider/master/rest_auth_provider.py
