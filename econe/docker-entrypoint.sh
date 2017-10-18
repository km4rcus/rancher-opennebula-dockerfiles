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
econe-server start
#ruby /usr/lib/one/ruby/cloud/econe/econe-server.rb
# deleting lock - for restarting the container
rm -f /var/lock/one/.econe.lock
# foreground process -
tail -f /var/log/one/econe-server.log
