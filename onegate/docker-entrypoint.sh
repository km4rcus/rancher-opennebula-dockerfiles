#!/bin/bash
#
# the container can start during ONE bootstrapping and
# it fails if onegate_auth is not present
# so the container wait until /var/lib/one/.one/onegate_auth is present
#
while [ ! -f /var/lib/one/.one_bootstrapped ]
do
    sleep 10;
done
ruby /usr/lib/one/onegate/onegate-server.rb
