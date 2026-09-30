---
type: server
status: active
area: homelab
hostname: aorusserver
ip_address: 10.0.0.136
created: 2026-07-31
updated: 2026-07-31
---

# AorusServer

## Role

AI and Home Inventory application server.

## System

| Item | Value |
|---|---|
| Hostname | `aorusserver` |
| Static IP | `10.0.0.136` |
| Operating system | Ubuntu 26.04 LTS |
| Kernel | Linux 7.0.0-22-generic |
| Motherboard | Gigabyte B450 AORUS M |
| Firmware | F50, dated 2019-11-27 |
| CPU | AMD Ryzen 5 2600X, 6 cores / 12 threads |
| Memory | 30 GiB usable |
| GPU | NVIDIA GeForce GTX 1060 6GB |
| Swap | 8 GiB |

## Storage

| Device | Size | Model | Use |
|---|---:|---|---|
| `nvme0n1` | 232.9 GiB | Samsung 970 EVO Plus 250GB | Ubuntu system disk; LVM/ext4 root |

## Host services

### Ollama

- Installed directly on Ubuntu as a system service.
- User interface: [Open WebUI](https://ai.jamesdkenney.com)
- GPU acceleration needs verification because `nvidia-smi` currently reports a driver/library version mismatch.

## Docker workloads

### Home Inventory

- Public URL: [home.jamesdkenney.com](https://home.jamesdkenney.com)
- Local gateway: `10.0.0.136:8181`
- Containers:
  - `home-inventory-app-1`
  - `home-inventory-auth-1`
  - `home-inventory-gateway-1`
  - `home-inventory-storage-1`
  - `home-inventory-rest-1`
  - `home-inventory-db-1`
- One-time containers that normally remain stopped after completing successfully:
  - `home-inventory-bootstrap-1`
  - `home-inventory-migrate-1`

### Open WebUI

- Public URL: [ai.jamesdkenney.com](https://ai.jamesdkenney.com)
- Container: `open-webui`
- Connects the browser interface to the host-level Ollama service.

## Administration

- SSH is available only from the home network.
- Docker applications are managed through separate Compose folders over SSH.
- Backups: none currently configured.
- Central monitoring: none currently configured.

## Attention items

- [ ] Repair and verify the NVIDIA driver/library installation.
- [ ] Confirm Ollama is using the GTX 1060 rather than CPU-only inference.
- [ ] Record Compose folder paths and restart requirements for both application stacks.
- [ ] Add application data, configuration, and database backups.

## Related

- [[06 HomeLab/Services/Service Catalog|Service Catalog]]
- [[06 HomeLab/Network and Storage/Network and Remote Access|Network and Remote Access]]
- [[06 HomeLab/Operations/Planned Improvements|Planned Improvements]]

Return to [[06 HomeLab/HomeLab Dashboard|HomeLab Dashboard]].
