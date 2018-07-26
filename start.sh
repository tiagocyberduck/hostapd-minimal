#!/usr/bin/env bash

python -c "import NetworkManager; NetworkManager.NetworkManager.GetDeviceByIpIface('wlan0').Managed = False"

ip addr flush dev wlan0
ip addr add 192.168.42.1/24 dev wlan0

sleep 20s

systemctl unmask dnsmasq
systemctl restart dnsmasq

systemctl unmask hostapd
systemctl restart hostapd

sleep infinity
