#!/bin/bash
#
# wait until /var/lib/one/.one/oneflow_auth is present
# the container can start during ONE bootstrapping and
# it fails if oneflow_auth is not present
#
while [ ! -f /var/lib/one/.one_bootstrapped ]
do
    sleep 10;
done
ruby /usr/lib/one/oneflow/oneflow-server.rb
