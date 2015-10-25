apt-get install hostapd
apt-get install dnsmasq

export TOTEM_LOCALHOST=10.0.0.1

ifconfig wlan0 down up $TOTEM_LOCALHOST

