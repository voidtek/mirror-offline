#!/bin/bash

httrack ${PLUGIN_WEBSITE} --path "/usr/share/nginx/html/" \
   -*.css \
   -*.js \
   --verbose
