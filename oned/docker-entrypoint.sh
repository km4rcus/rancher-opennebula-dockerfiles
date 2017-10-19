#!/bin/bash
#
# wait for the bootstrap to create the config files and to init the db
while [ ! -f /var/lib/one/.one_bootstrapped ] || [ ! -f /etc/one/oned.conf ] || [ ! -f /var/lib/one/.one/one_auth ]
do
    echo "waiting for bootstrapping ..."
    sleep 10;
done
/usr/bin/oned
sleep 10
rm -f /var/lock/one/one # we can't restart container if we don't remove the lock
/usr/bin/mm_sched
