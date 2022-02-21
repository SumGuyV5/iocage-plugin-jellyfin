#!/bin/sh -x
IP_ADDRESS=$(ifconfig | grep -E 'inet.[0-9]' | grep -v '127.0.0.1' | awk '{ print $2}')

VERSION="10.7.7"
fetch https://github.com/Thefrank/jellyfin-server-freebsd/releases/download/v${VERSION}/jellyfinserver-${VERSION}.pkg

pkg install -y jellyfinserver-$VERSION.pkg
rm jellyfinserver-$VERSION.pkg

ln -s /usr/local/lib/libsqlite3.so /usr/local/lib/libe_sqlite3

sysrc jellyfinserver_enable=TRUE

service jellyfinserver restart 2>/dev/null

echo -e "Jellyfin now installed.\n" > /root/PLUGIN_INFO
echo -e "\nPlease open your web browser and go to http://${IP_ADDRESS}:8096 to configure Jellyfin.\n" >> /root/PLUGIN_INFO