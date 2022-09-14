#!/bin/ash --

# Start the first process
nc -lk -p 80 -e /tmp/nc_reply.sh &
  
# Start the second process
java HelloWorld > /var/log/out 2> /var/log/err &

# Starts crond
crond -l 2 -f -L /var/log/crond
