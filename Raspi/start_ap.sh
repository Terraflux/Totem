#!/bin/bash
IPT=iptables
LOCALHOST=10.0.19.84
TOTEM_LOCALHOST=10.0.0.1
AP_INTERFACE=wlan4
#ifconfig $AP_INTERFACE down up $LOCALHOST


#service hostapd restart
#service dnsmasq restart

HTTP_PORT=3000



iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X

# Accept everything by default
#$IPT -t nat --policy PREROUTING ACCEPT
#$IPT -t nat --policy POSTROUTING ACCEPT
#$IPT -t nat --policy OUTPUT ACCEPT

#$IPT -A FORWARD --protocol ALL --in-interface $AP_INTERFACE -j ACCEPT
#$IPT -A FORWARD --in-interface $AP_INTERFACE -m state --state ESTABLISHED,RELATED -j ACCEPT


iptables -t nat -A PREROUTING --in-interface $AP_INTERFACE --protocol udp -j DNAT --to-destination $LOCALHOST:$HTTP_PORT
iptables -t nat -A PREROUTING --in-interface $AP_INTERFACE --protocol tcp -j DNAT --to-destination $LOCALHOST:$HTTP_PORT
#iptables -t nat -A PREROUTING --in-interface $AP_INTERFACE --protocol tcp --dport 80 -j REDIRECT --to-port $HTTP_PORT
