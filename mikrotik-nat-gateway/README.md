# MikroTik CHR NAT Gateway Lab using GNS3 and Fedora

## Overview

This project demonstrates the deployment of a MikroTik Cloud Hosted Router (CHR) in GNS3 as a NAT gateway for a small LAN network. Internet connectivity is provided through Fedora Linux using libvirt's virtual bridge (`virbr0`). The lab validates WAN connectivity, LAN communication, routing, and Network Address Translation (NAT).

This project serves as a foundational networking lab covering IP addressing, routing, gateway configuration, DHCP client operation, and source NAT implementation.

---

## Objectives

* Configure WAN connectivity using DHCP Client
* Configure LAN addressing
* Implement Source NAT (Masquerade)
* Verify LAN-to-LAN communication
* Verify LAN-to-Internet communication
* Integrate GNS3 with Fedora libvirt networking

---

## Network Topology

```text
                    Internet
                        |
                        |
                 Fedora Host
                  (WiFi)
                        |
                        |
                    virbr0
               192.168.122.1/24
                        |
                        |
                     Cloud
                        |
                        |
                 ether8 (WAN)
                  MikroTik CHR
                 ether1 (LAN)
                        |
                        |
                Ethernet Switch
                  /          \
                 /            \
               PC1            PC2
```

---

## Addressing Table

| Device       | Interface | IP Address             |
| ------------ | --------- | ---------------------- |
| MikroTik CHR | ether1    | 192.168.1.1/24         |
| MikroTik CHR | ether8    | DHCP (192.168.122.131) |
| PC1          | Ethernet0 | 192.168.1.10/24        |
| PC2          | Ethernet0 | 192.168.1.11/24        |
| virbr0       | -         | 192.168.122.1/24       |

Default Gateway:

```text
192.168.1.1
```

---

## Technologies Used

* Fedora 44
* GNS3
* MikroTik CHR 6.49.13
* libvirt
* virbr0 NAT Network
* VPCS
* Ethernet Switch (GNS3)

---

## Configuration

### WAN Configuration

Configure DHCP Client on the WAN interface:

```bash
/ip dhcp-client add interface=ether8 disabled=no
```

Verify:

```bash
/ip dhcp-client print
```

Expected status:

```text
bound
```

---

### LAN Configuration

Assign an IP address to the LAN interface:

```bash
/ip address add address=192.168.1.1/24 interface=ether1
```

Verify:

```bash
/ip address print
```

---

### NAT Configuration

Create a source NAT rule to allow private LAN addresses to access the Internet:

```bash
/ip firewall nat add chain=srcnat out-interface=ether8 action=masquerade
```

Verify:

```bash
/ip firewall nat print
```

---

## VPCS Configuration

### PC1

```text
ip 192.168.1.10/24 192.168.1.1
```

### PC2

```text
ip 192.168.1.11/24 192.168.1.1
```

Verify:

```text
show ip
```

---

## Verification

### LAN Connectivity

From PC1:

```text
ping 192.168.1.11
```

Expected result:

```text
Success
```

---

### Gateway Connectivity

From PC1:

```text
ping 192.168.1.1
```

Expected result:

```text
Success
```

---

### WAN Connectivity

From MikroTik:

```bash
ping 192.168.122.1
```

Expected result:

```text
Success
```

---

### Internet Connectivity

From MikroTik:

```bash
ping 8.8.8.8
```

Expected result:

```text
Success
```

From PC1:

```text
ping 8.8.8.8
```

Expected result:

```text
Success
```

---

## Troubleshooting

### Issue: DHCP Client Bound to Wrong Interface

Initial DHCP Client configuration was applied to `ether4`, resulting in an invalid state.

Incorrect:

```bash
/ip dhcp-client add interface=ether4 disabled=no
```

Solution:

```bash
/ip dhcp-client add interface=ether8 disabled=no
```

---

### Issue: Internet Not Working from LAN

Cause:

No NAT rule was configured.

Verification:

```bash
/ip firewall nat print
```

Output:

```text
(empty)
```

Solution:

```bash
/ip firewall nat add chain=srcnat out-interface=ether8 action=masquerade
```

---

### Issue: DNS Resolution from VPCS

Attempt:

```text
ping google.com
```

Result:

```text
Cannot resolve google.com
```

Reason:

The VPCS environment provides limited DNS functionality and may not support hostname resolution depending on the version used.

Internet connectivity was successfully verified using:

```text
ping 8.8.8.8
```

---

## Concepts Learned

* Layer 2 Switching
* IPv4 Addressing
* Default Gateway
* DHCP Client
* Routing
* WAN Connectivity
* Source NAT (Masquerade)
* Virtual Networking with libvirt
* GNS3 Integration with Linux Host Networking

---

## Lessons Learned

This lab demonstrated how a MikroTik router can act as a NAT gateway between a private LAN and an external network. The project also provided practical experience with GNS3 integration, virtual networking, route verification, and troubleshooting connectivity issues in a simulated environment.

The resulting architecture closely resembles a real-world home or small office network where a router provides Internet access to internal hosts through NAT.

---

## Author

Nova Wahyu Ramadhan

Telecommunication Engineering Student

Network Infrastructure & Cloud Enthusiast
