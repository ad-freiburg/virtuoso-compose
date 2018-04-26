#!/bin/bash

FREEBASEDB_URL="http://elba.informatik.uni-freiburg.de/freebase-qa/data/virtuoso.tar.gz"

#if [ ! -f /data/virtuoso.db ]; then
#	echo "Couldn't find virtuoso.db trying to download it"
#	wget $FREEBASEDB_URL -O - | tar xvfz - -C /data --strip-components=1
#fi

#if [ -f /data/virtuoso.db ]; then
#	echo "virtuoso.db found, starting daemon"
#	/app/bin/virtuoso-t -f +configfile /app/virtuoso.ini
#else
#	echo "Couldn't find virtuoso.db even after auto-download"
#	echo "ls -la /data"
#	ls -la /data
#fi

/app/bin/virtuoso-t -f +configfile /app/virtuoso.ini
