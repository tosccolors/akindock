#!/bin/bash
#
# Run docky in a container
#
# This script will create the user of the host to simulate docky-cli not-in-a-container
# 
# 
#
#echo "$(id -u)"
#if [ "$(id -u)" -eq 0 ]; then
#	groupadd -g $USERID $USERNAME
#	groupadd -g $DOCKERID docker
#	useradd -u $USERID -g $USERID $USERNAME
#	gpasswd -a ${USERNAME} docker
#	chown :docker /var/run/docker.sock
#	echo $@
#	exec su "$USERNAME" "$0" "$@"
#fi
#
#echo "This will be run from user $(id -u)"
exec /usr/local/bin/ak "$@"
