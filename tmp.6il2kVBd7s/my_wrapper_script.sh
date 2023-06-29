#!/bin/bash --

# Start the first process
nc -lk -p 8888 -e /tmp/nc_reply.sh &
  
# Start the second process
# Redirects output. This allows to see these messages through 'docker log' utility.
java HelloWorld | tee /var/log/${HOSTNAME}_out 2> /proc/1/fd/2 1> /proc/1/fd/1 &

# Starts crond to enable logrotate without reporting
crond -m off

#Creates pipe
mkfifo /tmp/message

# Reads from pipe until logrotate kicks in
while read filepath < /tmp/message
do
    curl --silent --show-error --fail --upload-file "${filepath}" "${BUCKET}" && \
	    rm "${filepath}" && \
	    /bin/echo "Upload OK ${filepath}" > /proc/1/fd/1 || \
	    /bin/echo "Upload NOK ${filepath}" > /proc/1/fd/2; 
done
