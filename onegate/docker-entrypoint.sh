#!/bin/bash
#
# wait for the bootstrap to create the config files and to init the db
#
while [ ! -f /var/lib/one/.one_bootstrapped ] || [ ! -f /etc/one/onegate-server.conf ] || [ ! -f /var/lib/one/.one/onegate_auth ]
do
    sleep 10;
done
ruby /usr/lib/one/onegate/onegate-server.rb
