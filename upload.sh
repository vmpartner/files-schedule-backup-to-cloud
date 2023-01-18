#!/bin/sh

set -e

if [ ! -d /source ]; then
  return
else

  dt=""
  if [ ! "$FOLDER_DATE" = "**None**" ]; then
    dt=`date +$FOLDER_DATE`
  fi

  echo "Start copy to $RCLONE_DEST/$dt"
  rclone sync --progress /source "$RCLONE_DEST/$dt"
  if [ "$CHECK_URL" = "**None**" ]; then
    echo "INFO: Define CHECK_URL with https://healthchecks.io to monitor sync job"
  else
    curl "$CHECK_URL"
  fi
fi