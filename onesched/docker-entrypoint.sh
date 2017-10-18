#!/bin/bash
#su oneadmin -s /bin/sh -c 'mm_sched'
# wait for the bootstrap to create the config files and to init the db
#while [ ! -f /var/lib/one/.one/one_auth ]
while [ ! -f /var/lib/one/.one_bootstrapped ]
do
    sleep 10;
done
mm_sched
