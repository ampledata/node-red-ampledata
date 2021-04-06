# Dockerfile for node-red-ampledata
#
# Author: Greg Albrecht W2GMD <oss@undef.net>
# Copyright: Copyright 2021 Orion Labs, Inc.
# License: Apache License, Version 2.0
# Source: https://github.com/ampledata/node-red-ampledata
#

FROM nodered/node-red:latest-12

RUN JOBS=MAX install_packages python3-pip

ENV NPM_TOKEN=${NPM_TOKEN}

WORKDIR /node-red-ampledata

COPY docker-entrypoint.sh docker-entrypoint.sh
COPY run_node-red.sh run_node-red.sh
COPY npmrc /root/.npmrc
COPY settings.js settings.js
COPY package.json package.json

RUN JOBS=MAX npm install --production --unsafe-perm

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["node-red"]
