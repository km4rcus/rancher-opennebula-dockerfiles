#!/bin/bash
if [ ! -f /var/lib/one/.one_bootstrapped ]
then
# waiting for config file to be created by the oneconf container
  while [ ! -f /etc/one/oned.conf ]
  do
    sleep 10
  done
# create one_auth file
  confd -onetime --backend rancher --prefix /2015-12-19
# bootstrap and init the OpenNebula DB
  /usr/bin/oned -i
# create sentinel file
  touch /var/lib/one/.one_bootstrapped
fi
tail -f /dev/null
