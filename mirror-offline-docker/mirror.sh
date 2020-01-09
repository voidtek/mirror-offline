#!/bin/bash

#  --convert-links \
#    -R css,js,gif,jpg,jpeg,png,svg,pdf,ppt,GIF,JPG,JPEG,PNG,SVG,PDF,PPT 
rm find /tmp/${PLUGIN_FOLDER}/index.html

wget -P /tmp \
    --mirror \
    --page-requisites \
    --no-parent \
    --html-extension \
    --no-timestamping \
    -U Mozilla \
    -e robots=off \
    --continue \
    --restrict-file-names=windows \
    --user=${PLUGIN_USER} \
    --password=${PLUGIN_PASSWORD} \
    ${PLUGIN_WEBSITE}

# For production site
find /tmp/${PLUGIN_FOLDER} -type f -exec sed -i -- "s-${PLUGIN_WEBSITE}-${PLUGIN_MIRROR}-g" {} +
# find /tmp/${PLUGIN_FOLDER} -type f -exec sed -i -- "s-${PLUGIN_PATH}-${PLUGIN_MIRROR}-g" {} +

find /tmp/${PLUGIN_FOLDER} -type f -exec sed -i -- "s-.css?-.css@-g" {} +
find /tmp/${PLUGIN_FOLDER} -type f -exec sed -i -- "s-.png?-.png@-g" {} +
find /tmp/${PLUGIN_FOLDER} -type f -exec sed -i -- "s-.jpg?-.jpg@-g" {} +

# find /tmp -type f ! -path *.html ! -path */default/files/* -exec mv '{}' '{}'.html \;
find /tmp/${PLUGIN_FOLDER} -type f -iname "*.png@*" -exec mv '{}' '{}.png' \;
find /tmp/${PLUGIN_FOLDER} -type f -iname "*.jpg@*" -exec mv '{}' '{}.jpg' \;
