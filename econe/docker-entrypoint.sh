#!/bin/bash
#
# wait for the bootstrap to create the config files and to init the db
while [ ! -f /var/lib/one/.one_bootstrapped ] || [ ! -f /etc/one/econe.conf ] || [ ! -f /var/lib/one/.one/ec2_auth ]
do
    sleep 10;
done
econe-server start
#ruby /usr/lib/one/ruby/cloud/econe/econe-server.rb
# deleting lock - for restarting the container
rm -f /var/lock/one/.econe.lock
# foreground process -
tail -f /var/log/one/econe-server.log
