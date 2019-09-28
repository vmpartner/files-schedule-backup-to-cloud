#!/bin/sh

set -e

if [ -d /source ]; then
  return
else
  rclone copy /source "$RCLONE_DEST"
  if [ "$CHECK_URL" = "**None**" ]; then
    echo "INFO: Define CHECK_URL with https://healthchecks.io to monitor sync job"
  else
    curl "$CHECK_URL"
  fi
fi