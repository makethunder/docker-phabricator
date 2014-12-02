#!/bin/bash

image=$(docker build -q -t test test/ | awk '/Successfully built/ { print $3 }')

if [ ! "$image" ]
then
  echo 'error building image'
  exit 1
fi

docker run --rm -ti --link phabricator:phabricator --link mysql:mysql "$image"
