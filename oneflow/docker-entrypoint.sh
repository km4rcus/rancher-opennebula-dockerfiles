#!/bin/bash
#
# wait for the bootstrap to create the config files and to init the db
#
while [ ! -f /var/lib/one/.one_bootstrapped ]
do
    sleep 10;
done
ruby /usr/lib/one/oneflow/oneflow-server.rb
