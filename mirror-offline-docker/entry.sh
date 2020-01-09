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

exec /mirror.sh &

ln -s /tmp/${PLUGIN_FOLDER} /usr/share/nginx/site
exec nginx -g "daemon off;"