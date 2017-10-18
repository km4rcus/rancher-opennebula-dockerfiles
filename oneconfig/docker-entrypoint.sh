#!/bin/bash
if [ ! -f /etc/one/oned.conf ]; then
# copy back the configuration files
  cp -r /opt/one/etc/* /etc/one
# create the configuration files for the services oned/sunstone/onesched/ssh
  confd -onetime --backend rancher --prefix /2015-12-19
  # sticky bit for /var/tmp
  #chmod +t /var/tmp
fi
tail -f /dev/null
