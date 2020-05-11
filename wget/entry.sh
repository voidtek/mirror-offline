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

PLUGIN_PATH=${PLUGIN_WEBSITE#*//}
PLUGIN_BASE="/${PLUGIN_PATH#*/}"
FILE_PATH="/tmp/${PLUGIN_PATH}"

wget \
    --directory-prefix=/tmp \
    --recursive \
    --timestamping \
    --level=inf \
    --page-requisites \
    --no-parent \
    --html-extension \
    --user-agent=Mozilla \
    --adjust-extension \
    --restrict-file-names=windows \
    --random-wait \
    --no-cache \
    --continue \
    --user=${PLUGIN_USER} \
    --password=${PLUGIN_PASSWORD} \
    ${PLUGIN_WEBSITE} || true

find ${FILE_PATH} -type f -exec sed -i -- "s-${PLUGIN_WEBSITE}-${PLUGIN_MIRROR}-g" {} +
find ${FILE_PATH} -type f -exec sed -i -- "s-${PLUGIN_BASE}-${PLUGIN_MIRROR}-g" {} +

find ${FILE_PATH} -type f -exec sed -i -- "s-.css?-.css@-g" {} +
find ${FILE_PATH} -type f -exec sed -i -- "s-.png?-.png@-g" {} +
find ${FILE_PATH} -type f -exec sed -i -- "s-.jpg?-.jpg@-g" {} +

find ${FILE_PATH} -type f -iname "*.png@*" -exec mv '{}' '{}.png' \;
find ${FILE_PATH} -type f -iname "*.jpg@*" -exec mv '{}' '{}.jpg' \;

find ${FILE_PATH} -type f -exec sed -i -- "s-.css%3F-.css@-g" {} +
find ${FILE_PATH} -type f -exec sed -i -- "s-.png%3F-.png@-g" {} +
find ${FILE_PATH} -type f -exec sed -i -- "s-.jpg%3F-.jpg@-g" {} +

count=$(find ${FILE_PATH} -type f -iname "*%3F*" | wc -l)
if [ $count -gt 0 ] ; then
    find ${FILE_PATH} -type f -iname "*%3F*" | sed -e "p;s-%3F-@-g" | xargs -n2 mv
fi

echo "All internal links updated."
