#!/bin/bash
LOCALHOST=10.0.19.84
AP_INTERFACE=wlan4
#ifconfig $AP_INTERFACE down up $LOCALHOST



HTTP_PORT=3000



iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X


iptables -t nat -A PREROUTING --in-interface $AP_INTERFACE --protocol tcp -j REDIRECT --dst $LOCALHOST --to-ports $HTTP_PORT
