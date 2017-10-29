#!/bin/bash

DOCKER_GROUP_ID=${DOCKER_GROUP_ID:-9001}
groupadd -o -g $DOCKER_GROUP_ID docker

USER_ID=${DOCKER_USER_ID:-9001}
USER=${DOCKER_USER:-dclong}
PASSWORD=${DOCKER_PASSWORD:-$USER}
export HOME=/home/$USER
useradd -om -u $USER_ID -g docker -d $HOME -s /bin/bash -c "$USER" $USER
echo ${USER}:${PASSWORD} | chpasswd
gpasswd -a $USER sudo

cd $HOME
su -m $USER && echo $PASSWORD | sudo -S -u $USER ${1:-/scripts/launch.sh}
