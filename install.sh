#!/usr/bin/env bash

URL=https://raw.githubusercontent.com/honzahommer/debian-stretch-zfs-root/master/debian-stretch-zfs-root.sh
TMP=$(mktemp)
CMD="command $TMP"

if type curl > /dev/null 2>&1; then
  curl $URL 2>/dev/null > $TMP
elif type wget > /dev/null 2>&1; then
  wget -qO- $URL > $TMP
else
  echo "ERROR: You need curl or wget"
  exit 1
fi

if [ ! -f $TMP ]; then
  echo "ERROR: Failed to download '$URL'"
  exit 1
fi

chmod +x $TMP

case $1 in
  -f|--force) $CMD ;;
  *) echo "$CMD" ;;
esac