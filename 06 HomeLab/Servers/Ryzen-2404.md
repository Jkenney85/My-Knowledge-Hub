---
type: server
status: active
area: homelab
hostname: ryzen-2404
ip_address: 10.0.0.56
created: 2026-07-31
updated: 2026-07-31
---

# Ryzen-2404

## Role

Primary application, reverse-proxy, media, source-control, and file server. This is the most critical host in the current HomeLab because it provides public routing and shared storage in addition to most Docker workloads.

## System

| Item | Value |
|---|---|
| Hostname | `ryzen-2404` |
| Static IP | `10.0.0.56` |
| Operating system | Ubuntu 24.04.4 LTS |
| Kernel | Linux 6.8.0-124-generic |
| Motherboard | MSI MS-7C56 |
| Firmware | 1.90, dated 2022-03-17 |
| CPU | AMD Ryzen 5 5500, 6 cores / 12 threads |
| Memory | 31 GiB usable |
| GPU | AMD Radeon RX 470/480/570/580-series |
| Swap | 8 GiB |

## Storage

| Device | Size | Model | Mount/use |
|---|---:|---|---|
| `nvme0n1` | 476.9 GiB | WD WDS512G1X0C | Ubuntu system disk; LVM/ext4 root |
| `sdb` | 9.1 TiB | WD WD100EFGX-68 | NTFS media disk mounted at `/home/jkenney/Media` |
| `sda` | 465.8 GiB | Samsung SSD 860 | ext4; no mount point shown in the inventory |

The media disk is shared by Samba with the desktop computer and MacBook. See [[06 HomeLab/Network and Storage/Storage and File Sharing|Storage and File Sharing]].

## Infrastructure workloads

- **Traefik:** public HTTPS reverse proxy and certificate handling
- **Gitea + MySQL:** self-hosted Git service
- **Vaultwarden:** password vault
- **Speedtest Tracker:** internet-speed history

## Custom application workloads

- Futures Trading Journal + PostgreSQL
- Training Portal frontend, backend, and PostgreSQL
- StreamPulse / Stream Tracker + PostgreSQL
- Recipe App / Mealie frontend and backend
- Pistol League
- Photography Site

## Media workloads

- Plex
- Jellyfin
- Sonarr
- Radarr
- Lidarr
- Prowlarr
- Transmission
- SABnzbd

Full container names, access methods, ports, and public routes are recorded in the [[06 HomeLab/Services/Service Catalog|Service Catalog]].

## Network services

- Traefik dashboard on LAN: [10.0.0.56:88](http://10.0.0.56:88/dashboard/)
- Router forwards public ports 80 and 443 to Traefik.
- SSH is available only from the home network.
- Samba shares the media disk with the desktop and MacBook.

## Administration

- Docker applications are managed through separate Compose folders over SSH.
- Backups: none currently configured.
- Central monitoring: none currently configured.

## Attention items

- [ ] Back up Traefik configuration, certificates, databases, application data, and the Samba share.
- [ ] Verify whether `dashboard-auth@file` protects the public Traefik dashboard route.
- [ ] Verify which public routes use `security-headers@file`.
- [ ] Review authentication for publicly exposed administration tools.
- [ ] Identify the intended purpose and mount configuration of the Samsung 860 SSD.
- [ ] Record Compose folder paths and per-stack update/restart procedures.

## Related

- [[06 HomeLab/Network and Storage/Network and Remote Access|Network and Remote Access]]
- [[06 HomeLab/Network and Storage/Storage and File Sharing|Storage and File Sharing]]
- [[06 HomeLab/Operations/Docker and Deployment|Docker and Deployment]]
- [[06 HomeLab/Operations/Planned Improvements|Planned Improvements]]

Return to [[06 HomeLab/HomeLab Dashboard|HomeLab Dashboard]].
