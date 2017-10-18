#!/bin/bash
#
# wait for the bootstrap to create the config files and to init the db
#while [ ! -f /var/lib/one/.one/one_auth ]
while [ ! -f /var/lib/one/.one_bootstrapped ]
do
    sleep 10;
done
#/usr/bin/oned -f
/usr/bin/oned
sleep 10
rm -f /var/lock/one/one # we can't restart container if we don't remove the lock
#tail -f /var/log/one/oned.log # foreground process
# tail -f /dev/null
# starting the sched
/usr/bin/mm_sched
