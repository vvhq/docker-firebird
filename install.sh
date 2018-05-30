#!/bin/bash

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EF648708 && \
echo "deb http://ppa.launchpad.net/mapopa/ppa/ubuntu xenial main" > /etc/apt/sources.list.d/firebird.list && \
apt-get update && \
apt-get install -y -qqq firebird${FIREBIRD_VERSION}-${FIREBIRD_ARCHITECTURE} && \
apt-get autoremove -y && \
apt-get clean all  && \
rm -rf /var/lib/apt/lists/*
sed -ri 's/RemoteBindAddress = localhost/RemoteBindAddress = 0.0.0.0/g' /etc/firebird/${FIREBIRD_VERSION}/firebird.conf
