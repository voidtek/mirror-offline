#!/bin/bash

rm -rf /usr/share/nginx/html/*
# wget -P /tmp -mpck --user-agent="" -e robots=off -R js,gif,jpg,jpeg,png,pdf,ppt,GIF,JPG,JPEG,PNG,PDF,PPT -E ${PLUGIN_WEBSITE}
wget -P /tmp -mpck --user-agent="" -e robots=off -E ${PLUGIN_WEBSITE}
mv -f /tmp/${PLUGIN_FOLDER}/* /usr/share/nginx/html