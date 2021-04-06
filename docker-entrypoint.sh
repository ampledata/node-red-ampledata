#!/bin/sh
# docker-entrypoint.sh for node-red-ampledata
#
# Author: Greg Albrecht W2GMD <oss@undef.net>
# Copyright: Copyright 2021 Orion Labs, Inc.
# License: Apache License, Version 2.0
# Source: https://github.com/ampledata/node-red-ampledata
#

set -e

echo "Inside docker-entrypoint.sh"

if [ -z "${ENABLE_CONTAINER}" ]; then
  echo "ENABLE_CONTAINER not set, sleeping..."
  sleep 3600
  exit 0
fi

if [ "$1" = "node-red" ]; then
  echo "Executing run_node-red.sh"
  ./run_node-red.sh
else
  echo "Executing '$@'"
  exec "$@"
fi
exit $?
