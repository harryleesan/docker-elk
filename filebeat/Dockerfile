FROM ubuntu:16.04
MAINTAINER Harry Lee

VOLUME /var/log/nginx

RUN apt-get update && apt-get install -y \
	wget \
	apt-transport-https \
	nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

