FROM ubuntu:18.04

RUN apt update
RUN apt install -y bind9
RUN apt install -y bind9utils bind9-doc bind9-host

RUN apt install -y iputils-ping
RUN apt install -y dnsutils
RUN apt install -y lsof
RUN apt install -y nano
RUN apt install -y iproute2

#RUN apt install 

#RUN apk add --no-cache bind
#RUN apk add --no-cache bash
COPY named.conf.options /named.conf.options
COPY named.conf.local /named.conf.local
#COPY hiroom2.com.zone /hiroom2.com.zone
COPY home.zone /home.zone
COPY entrypoint.sh /entrypoint.sh

EXPOSE 53 53/udp

CMD ["/bin/bash", "/entrypoint.sh"]
