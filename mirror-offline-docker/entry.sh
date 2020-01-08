#!/bin/bash

# Parameters :
#
# pipeline:
#   offline-mirror:
#     image: fpfis/drone-offline-mirror
#     website: website
#     

set -e
set -o pipefail

if [ "${PLUGIN_WEBSITE}" == "" ]; then
    echo "> Website is empty !"
    exit 5
fi

exec /mirror.sh &
exec nginx -g "daemon off;"