# jun/03/2026 09:05:05 by RouterOS 6.49.13
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
/ip address
add address=192.168.1.1/24 interface=ether1 network=192.168.1.0
/ip dhcp-client
add disabled=no interface=ether1
add interface=ether4
add disabled=no interface=ether8
/ip dns
set allow-remote-requests=yes servers=8.8.8.8,1.1.1.1
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether8
add action=masquerade chain=srcnat out-interface=ether8
add action=masquerade chain=srcnat out-interface=ether8
