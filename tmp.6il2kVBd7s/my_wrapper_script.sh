#!/bin/bash --

# Start the first process
nc -lk -p 8888 -e /tmp/nc_reply.sh &
  
# Start the second process
# Redirects output. This allows to see these messages through 'docker log' utility.
java HelloWorld | tee /var/log/${HOSTNAME}_out 2> /proc/1/fd/2 1> /proc/1/fd/1 &

# Starts crond in the foreground to enable logrotate
crond -n -m off
