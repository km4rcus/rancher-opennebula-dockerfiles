#!/bin/bash
#
# waiting for the bootstrap and then start
while [ ! -f /var/lib/one/.one_bootstrapped ]
do
    sleep 10;
done
/usr/bin/novnc-server start
ruby /usr/lib/one/sunstone/sunstone-server.rb
