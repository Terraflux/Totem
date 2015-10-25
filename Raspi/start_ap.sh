service hostapd restart
service dnsmasq restart

HTTP_PORT=8080

iptables -t nat -A PREROUTING --in-interface wlan0 --protocol tcp -j DNAT --to-destination $TOTEM_LOCALHOST:$HTTP_PORT
