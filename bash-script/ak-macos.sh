#!/bin/bash
#
# Run ak in a container
#
# This script will attempt to mirror the host paths by using volumes for the
# following paths:
#   * $(pwd)
#   * $(dirname $COMPOSE_FILE) if it's set
#   * $HOME if it's set
#
#


set -e

VERSION="2.0"
IMAGE="tosc-registry:443/akindock:latest"
USER=$USER
VD_SCRIPT="/usr/local/bin/ak"

# Setup options for connecting to docker host
if [ -z "$DOCKER_HOST" ]; then
    DOCKER_HOST="/var/run/docker.sock"
fi
if [ -S "$DOCKER_HOST" ]; then
    DOCKER_ADDR="-v $DOCKER_HOST:$DOCKER_HOST -e DOCKER_HOST"
else
    DOCKER_ADDR="-e DOCKER_HOST -e DOCKER_TLS_VERIFY -e DOCKER_CERT_PATH"
fi


# Setup volume mounts for compose config and context
if [ "$(pwd)" != '/' ]; then
    VOLUMES="-v $(pwd):$(pwd)"
fi

if [ -n "$HOME" ]; then
    VOLUMES="$VOLUMES -v $HOME:/home/$USER" # mount $HOME in /home/user to share docker.config and the docky files
fi

# Only allocate tty if we detect one
if [ -t 1 ]; then
    DOCKER_RUN_OPTIONS="-t"
fi
if [ -t 0 ]; then
    DOCKER_RUN_OPTIONS="$DOCKER_RUN_OPTIONS -i"
fi
DOCKER_RUN_OPTIONS="$DOCKER_RUN_OPTIONS -e USERID=$UID -e USERNAME=$USER -e DOCKERID=$DOCKERID"
exec docker run --rm $DOCKER_RUN_OPTIONS $DOCKER_ADDR $VOLUMES -w "$(pwd)" $IMAGE "$@"
