#! /bin/sh

set -e

if [ "$SCHEDULE" = "**None**" ]; then
  while true
  do
      sh /upload.sh
      echo ""
      echo "Sleep 48h..."
      echo ""
      sleep 48h
  done
else
  echo "$SCHEDULE /upload.sh" > /crontab.txt && \
  /usr/bin/crontab /crontab.txt && \
  exec /usr/sbin/crond -f -l 8
fi