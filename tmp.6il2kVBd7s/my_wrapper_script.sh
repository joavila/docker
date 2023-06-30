#!/bin/bash --

# Start the first process
nc -lk -p 8888 -e /tmp/nc_reply.sh &
  
# Start the second process
# Redirects output. This allows to see these messages through 'docker log' utility.
java HelloWorld | tee /var/log/${HOSTNAME}_out 2> /proc/1/fd/2 1> /proc/1/fd/1 &

# Starts crond to enable logrotate without reporting
crond -m off

#Creates pipe for rotation details exchange
mkfifo /tmp/message

# Reads from pipe until logrotate kicks in
while read FILE < /tmp/message
do
  if [ -f "$FILE" ]; then
    echo "Rotated file is $FILE" > /proc/1/fd/1; 
    if [ -z "$BUCKET" ]; then
      echo "Bucket definition is missing." > /proc/1/fd/2; 
    else
      curl --silent --show-error --fail --upload-file "$FILE" "$BUCKET" && \
        rm "$FILE" && \
        echo "Upload OK $FILE" > /proc/1/fd/1 || \
        echo "Upload NOK $FILE" > /proc/1/fd/2; 
    fi
  else 
    echo "$FILE does not exist." > /proc/1/fd/2; 
  fi
done
