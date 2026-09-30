---
type: server
status: active
area: homelab
hostname: hp-serv
ip_address: 10.0.0.71
created: 2026-07-31
updated: 2026-07-31
---

# HP-serv

## Role

Secondary application and automation server running on a repurposed laptop.

## System

| Item | Value |
|---|---|
| Hostname | `hp-serv` |
| Static IP | `10.0.0.71` |
| Operating system | Ubuntu 24.04.4 LTS |
| Kernel | Linux 6.17.0-14-generic |
| Hardware | HP ProBook 650 G1 |
| Firmware | L77 Ver. 01.39, dated 2016-09-26 |
| CPU | Intel Core i7-4712MQ, 4 cores / 8 threads |
| Memory | 15 GiB usable |
| GPU | Intel 4th-generation integrated graphics |
| Swap | 4 GiB |

## Storage

| Device | Size | Model | Use |
|---|---:|---|---|
| `sda` | 232.9 GiB | Samsung 850 EVO 250GB | Ubuntu ext4 system disk |

## Docker workloads

### Sable Iron Studio

- Local application port: `10.0.0.71:3000`
- Containers:
  - `sable-iron-studio-app-1`
  - `sable-iron-studio-db-1` — PostgreSQL 16
  - `sable-iron-studio-mailpit-1` — Mailpit on ports 1025 and 8025
- No Traefik public route was present when inventoried.

### Homarr

- Public URL: [links.jamesdkenney.com](https://links.jamesdkenney.com)
- Local port: `10.0.0.71:7575`
- Container: `homarr`

### n8n

- Public URL: [n8n.jamesdkenney.com](https://n8n.jamesdkenney.com)
- Local port: `10.0.0.71:5678`
- Container: `n8n-n8n-1`

## Administration

- SSH is available only from the home network.
- Docker applications are managed through separate Compose folders over SSH.
- Backups: none currently configured.
- Central monitoring: none currently configured.

## Attention items

- [ ] Back up n8n workflows and credentials, Homarr configuration, and the Sable Iron Studio database.
- [ ] Record Compose folder paths and restart requirements for each stack.
- [ ] Decide whether Mailpit and PostgreSQL should remain bound to all LAN interfaces.

## Related

- [[06 HomeLab/Services/Service Catalog|Service Catalog]]
- [[06 HomeLab/Network and Storage/Network and Remote Access|Network and Remote Access]]
- [[06 HomeLab/Operations/Planned Improvements|Planned Improvements]]

Return to [[06 HomeLab/HomeLab Dashboard|HomeLab Dashboard]].
