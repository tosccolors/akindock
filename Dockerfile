ARG DOCKER_VERSION=18.09.5
ARG PYTHON_VERSION=3.7.3
ARG BUILD_DEBIAN_VERSION=slim-stretch
ARG RUNTIME_DEBIAN_VERSION=stretch-20190326-slim


FROM python:${PYTHON_VERSION}-${BUILD_DEBIAN_VERSION} AS build-debian
RUN apt-get update && apt-get install -y \
    curl \
    gcc \
    git \
    libc-dev \
    libgcc-6-dev \
    make \
    openssl

RUN pip install https://github.com/akretion/ak/archive/master.zip


ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
