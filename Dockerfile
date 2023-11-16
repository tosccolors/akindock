ARG DOCKER_VERSION=24.0.7
ARG PYTHON_VERSION=3.10
ARG BUILD_DEBIAN_VERSION=slim-bullseye
ARG RUNTIME_DEBIAN_VERSION=slim-bullseye


FROM python:${PYTHON_VERSION}-${BUILD_DEBIAN_VERSION} AS build-debian
RUN apt-get update && apt-get install -y \
    curl \
    gcc \
    git \
    libc-dev \
#    libgcc-6-dev \
    make \
    openssl

#RUN pip install https://github.com/akretion/ak/archive/master.zip
#RUN pip install pipx
RUN python3 -m pip install git+https://github.com/akretion/ak


ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
