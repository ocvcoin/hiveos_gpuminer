#!/usr/bin/env bash

stats=`echo 'hiveos_stats' | nc -w 5 localhost 30258`

khs=`echo 'hiveos_khs' | nc -w 5 localhost 30258`