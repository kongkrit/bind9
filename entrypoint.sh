#!/bin/bash

echo "cp /named.conf.options /etc/bind/named.conf.options"
cp /named.conf.options /etc/bind/named.conf.options
echo "cp /named.conf.local /etc/bind/named.conf.local"
cp /named.conf.local /etc/bind/named.conf.local
echo "cp /home.zone /var/cache/bind/home.zone"
cp /home.zone /var/cache/bind/home.zone

echo "/usr/sbin/named-checkconf"
/usr/sbin/named-checkconf
echo "/usr/sbin/named-checkzone home /var/cache/bind/home.zone"
/usr/sbin/named-checkzone home /var/cache/bind/home.zone

#SEDEX="s/bind:x:[0-9]+:[0-9]+:/bind:x:0:0:/g"
#sed -i-E "$SEDEX" /etc/passwd

echo "service bind9 start"
service bind9 start

echo "!!! done !!!"
J=1
while true; do
    echo "5-min heartbeats #""$J"
    sleep 5m
    J=$((J+1))
done

