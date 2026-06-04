# SOHO Office Network

## Overview

This project simulates a Small Office Home Office (SOHO) network using MikroTik CHR as the gateway and DHCP server. All clients are connected to a single LAN segment and obtain IP addresses automatically through DHCP.

The network is designed to demonstrate fundamental networking concepts including IPv4 addressing, subnetting, switching, gateway configuration, and DHCP deployment.

---

## Scenario

A small office requires a simple and centralized network infrastructure for daily operations. To reduce manual configuration effort, IP addresses are assigned dynamically using DHCP.

The router serves as:

- Default Gateway
- DHCP Server

The switch provides Layer 2 connectivity between all client devices.

---

## Network Topology

```text
                   Internet / ISP
                        |
                        |
                 +-------------+
                 | MikroTik CHR|
                 |192.168.10.1 |
                 +------+------+ 
                        |
                        |
                 +-------------+
                 |   Switch    |
                 +------+------+ 
                   |    |    |
                   |    |    |
                 +-+-+ +-+-+ +-+-+
                 |PC1| |PC2| |PC3|
                 +---+ +---+ +---+
                  DHCP DHCP DHCP
```

---

## Devices

| Device | Quantity |
|----------|----------|
| MikroTik CHR | 1 |
| Ethernet Switch | 1 |
| VPCS | 3 |

---

## Network Requirements

| Parameter | Value |
|------------|---------|
| Host Requirement | 50 Hosts |
| Address Assignment | DHCP |
| Gateway | Router |
| VLAN | Not Used |
| Routing | Connected Route |

---

## IP Addressing Plan

### Network

```text
192.168.10.0/26
```

### Subnet Details

| Item | Value |
|---------|---------|
| Network Address | 192.168.10.0 |
| Prefix Length | /26 |
| Subnet Mask | 255.255.255.192 |
| Usable Hosts | 62 |
| Gateway | 192.168.10.1 |
| Broadcast | 192.168.10.63 |

### DHCP Range

```text
192.168.10.11 - 192.168.10.62
```

---

## Address Allocation

| Device | Interface | Address |
|----------|----------|----------|
| MikroTik CHR | ether1 | 192.168.10.1/26 |
| PC1 | DHCP | Dynamic |
| PC2 | DHCP | Dynamic |
| PC3 | DHCP | Dynamic |

---

## Verification

### Router Interface

```bash
/ip address print
```

### DHCP Server

```bash
/ip dhcp-server print
```

### DHCP Lease

```bash
/ip dhcp-server lease print
```

### Client IP Information

```bash
show ip
```

### Gateway Connectivity

```bash
ping 192.168.10.1
```

### Host-to-Host Connectivity

```bash
ping <destination-ip>
```

---

## Results

| Test | Status |
|--------|--------|
| Router Interface Active | PASS |
| DHCP Server Running | PASS |
| DHCP Lease Assigned | PASS |
| Client Received IP Address | PASS |
| Gateway Reachable | PASS |
| Host-to-Host Connectivity | PASS |

---

## Skills Demonstrated

- IPv4 Addressing
- Subnetting
- VLSM Planning
- DHCP Deployment
- MikroTik Configuration
- Layer 2 Switching
- Gateway Configuration
- Basic Network Troubleshooting
- Network Documentation

---

## Repository Structure

```text
soho-office-network/
├── README.md
├── configs/
├── screenshots/
├── topology/
└── verification/
```
