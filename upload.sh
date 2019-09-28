#!/bin/sh

set -e

if [ -d /source ]; then
  return
else
  rclone copy /source "$RCLONE_DEST"
fi