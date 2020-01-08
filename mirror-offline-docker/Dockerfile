FROM nginx
ADD entry.sh /entry.sh
ADD mirror.sh /mirror.sh
RUN chmod +x /entry.sh
RUN chmod +x /mirror.sh

RUN apt-get update && apt-get install -y httrack && rm -rf /var/lib/apt/lists/*

ENV PLUGIN_WEBSITE none

ENTRYPOINT ["/entry.sh"]
