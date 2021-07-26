#!/bin/bash

function main {
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y build-essential binutils-doc autoconf flex bison libjpeg-dev
  apt-get install -y libfreetype6-dev zlib1g-dev libzmq3-dev libgdbm-dev libncurses5-dev
  apt-get install -y automake libtool curl git tmux gettext
  apt-get install -y nginx rabbitmq-server
  apt-get install -y python3 python3-pip python3-dev python3-venv 
  apt-get install -y libxml2-dev libxslt-dev
  apt-get install -y libssl-dev libffi-dev
  curl -sL https://deb.nodesource.com/setup_12.x | bash -
  apt-get install -y nodejs
  adduser taiga
  adduser taiga sudo
}

set -ex
echo "Script starting @ `date` "
main
echo "Script ended @ `date` "
set +ex