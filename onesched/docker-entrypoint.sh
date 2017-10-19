#!/bin/bash
#
# wait for the bootstrap to create the config files and to init the db
#
while [ ! -f /var/lib/one/.one_bootstrapped ] || [ ! -f /etc/one/sched.conf ]
do
    sleep 10;
done
mm_sched
