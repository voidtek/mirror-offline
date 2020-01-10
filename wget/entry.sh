#!/bin/sh

# Parameters :
#
# pipeline:
#   wget-website:
#     image: wget-website
#     WEBSITE:
#     MIRROR:
#     USER:
#     PASSWORD:
#

set -e
set -o pipefail

wget \
    --directory-prefix=/tmp \
    --mirror \
    --page-requisites \
    --no-parent \
    --html-extension \
    --user-agent=Mozilla \
    --execute robots=off \
    --restrict-file-names=windows \
    --random-wait \
    --continue \
    --user=${PLUGIN_USER} \
    --password=${PLUGIN_PASSWORD} \
    ${PLUGIN_WEBSITE}

find /tmp/${PLUGIN_WEBSITE#*//} -type f -exec sed -i -- "s-${PLUGIN_WEBSITE}-${PLUGIN_MIRROR}-g" {} +

find /tmp/${PLUGIN_WEBSITE#*//} -type f -exec sed -i -- "s-.css?-.css@-g" {} +
find /tmp/${PLUGIN_WEBSITE#*//} -type f -exec sed -i -- "s-.png?-.png@-g" {} +
find /tmp/${PLUGIN_WEBSITE#*//} -type f -exec sed -i -- "s-.jpg?-.jpg@-g" {} +

find /tmp/${PLUGIN_WEBSITE#*//} -type f -iname "*.png@*" -exec mv '{}' '{}.png' \;
find /tmp/${PLUGIN_WEBSITE#*//} -type f -iname "*.jpg@*" -exec mv '{}' '{}.jpg' \;
