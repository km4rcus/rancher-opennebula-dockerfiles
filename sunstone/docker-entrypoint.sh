#!/bin/bash
#
# wait for the bootstrap to create the config files and to init the db
#
while [ ! -f /var/lib/one/.one_bootstrapped ] || [ ! -f /etc/one/sunstone-server.conf ] || [ ! -f /var/lib/one/.one/sunstone_auth ]
do
    sleep 10;
done
/usr/bin/novnc-server start
ruby /usr/lib/one/sunstone/sunstone-server.rb
