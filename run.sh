#! /bin/sh

set -e

if [ "$SCHEDULE" = "**None**" ]; then
  sh /upload.sh && sleep 4h
else
  echo "$SCHEDULE /upload.sh" > /crontab.txt && \
  /usr/bin/crontab /crontab.txt && \
  exec /usr/sbin/crond -f -l 8
fi