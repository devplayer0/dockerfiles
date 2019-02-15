FROM matrixdotorg/synapse:latest

RUN wget -O $(python -c "import site; print(site.getsitepackages()[0])")/rest_auth_provider.py https://raw.githubusercontent.com/kamax-matrix/matrix-synapse-rest-auth/master/rest_auth_provider.py
