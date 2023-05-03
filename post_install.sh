#!/bin/sh -x
IP_ADDRESS=$(ifconfig | grep -E 'inet.[0-9]' | grep -v '127.0.0.1' | awk '{ print $2}')

sysrc jellyfin_enable=TRUE

service jellyfin restart 2>/dev/null

echo -e "Jellyfin now installed.\n" > /root/PLUGIN_INFO
echo -e "\nPlease open your web browser and go to http://${IP_ADDRESS}:8096 to configure Jellyfin.\n" >> /root/PLUGIN_INFO