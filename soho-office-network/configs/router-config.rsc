# jun/04/2026 06:09:28 by RouterOS 6.49.13
# software id = 
#
#
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
set [ find default-name=ether7 ] disable-running-check=no
set [ find default-name=ether8 ] disable-running-check=no
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip pool
add name=LAN_POOL ranges=192.168.10.11-192.168.10.62
/ip dhcp-server
add address-pool=LAN_POOL disabled=no interface=ether1 name=LAN_DHCP
/ip address
add address=192.168.10.1/26 interface=ether1 network=192.168.10.0
/ip dhcp-client
add disabled=no interface=ether1
/ip dhcp-server network
add address=192.168.10.0/26 dns-server=8.8.8.8 gateway=192.168.10.1
