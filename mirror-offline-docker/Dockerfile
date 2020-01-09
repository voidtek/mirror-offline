FROM nginx
ADD entry.sh /entry.sh
ADD mirror.sh /mirror.sh
ADD default.conf /etc/nginx/conf.d/default.conf

RUN chmod +x /entry.sh
RUN chmod +x /mirror.sh

RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/entry.sh"]
