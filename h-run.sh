#!/usr/bin/env bash

. h-manifest.conf

#try to release TIME_WAIT sockets
while true; do
  for con in `netstat -anp | grep TIME_WAIT | grep 30258 | awk '{print $5}'`; do
    killcx $con lo
  done
  netstat -anp | grep TIME_WAIT | grep 30258 &&
    continue ||
    break
done


CUSTOM_LOG_BASEDIR=`dirname "$CUSTOM_LOG_BASENAME"`
[[ ! -d $CUSTOM_LOG_BASEDIR ]] && mkdir -p $CUSTOM_LOG_BASEDIR

rm -rf "$CUSTOM_LOG_BASENAME.log"

ocvcoin-gpuminer  $(< ocvcoin-gpuminer.conf) 2>&1 | tee --append "$CUSTOM_LOG_BASENAME.log"
