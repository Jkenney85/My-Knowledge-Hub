---
type: dashboard
status: active
area: homelab
created: 2026-06-18
updated: 2026-07-31
---

# HomeLab Dashboard

Three Ubuntu servers provide public applications, AI, media, file sharing, automation, and development services. Docker Compose stacks are currently managed manually over LAN-only SSH, with Traefik on Ryzen-2404 serving as the public HTTPS entry point.

> [!danger] Highest priority: backups
> No server, database, application-data, configuration, or media-share backups are currently configured. Start with [[06 HomeLab/Operations/Backups and Recovery|Backups and Recovery]].

## Servers

| Server                           | Static IP     | Main roles   | Platform                                |                                                       |
| -------------------------------- | ------------- | ------------ | --------------------------------------- | ----------------------------------------------------- |
| [[06 HomeLab/Servers/Ryzen-2404  | Ryzen-2404]]  | `10.0.0.56`  | Traefik, Samba, most apps, media, Gitea | Ryzen 5 5500, 31 GiB RAM, Ubuntu 24.04.4              |
| [[06 HomeLab/Servers/AorusServer | AorusServer]] | `10.0.0.136` | Ollama, Open WebUI, Home Inventory      | Ryzen 5 2600X, 30 GiB RAM, GTX 1060 6GB, Ubuntu 26.04 |
| [[06 HomeLab/Servers/HP-serv     | HP-serv]]     | `10.0.0.71`  | Homarr, n8n, Sable Iron Studio          | Core i7-4712MQ, 15 GiB RAM, Ubuntu 24.04.4            |

## Quick access

### Infrastructure and administration

- [Homarr](https://links.jamesdkenney.com)
- [Traefik dashboard](https://traefik.jamesdkenney.com) · [LAN dashboard](http://10.0.0.56:88/dashboard/)
- [Gitea](https://git.jamesdkenney.com)
- [Vaultwarden](https://vault.jamesdkenney.com)
- [n8n](https://n8n.jamesdkenney.com)

### Applications and AI

- [Open WebUI](https://ai.jamesdkenney.com)
- [Home Inventory](https://home.jamesdkenney.com)
- [Futures Trading Journal](https://journal.jamesdkenney.com)
- [StreamPulse](https://streampulse.jamesdkenney.com)
- [Training Portal](https://train.jamesdkenney.com)
- [Mealie](https://mealie.jamesdkenney.com)
- [Pistol League](https://pistol.jamesdkenney.com)
- [Photography Site](https://jamesdkenney.com)

### Media

- [Jellyfin](https://jellyfin.jamesdkenney.com)
- [Sonarr](https://sonarr.jamesdkenney.com)
- [Radarr](https://radarr.jamesdkenney.com)
- [Lidarr](https://lidarr.jamesdkenney.com)
- [Prowlarr on LAN](http://10.0.0.56:9696)
- [Transmission on LAN](http://10.0.0.56:9091)
- [SABnzbd on LAN](http://10.0.0.56:8088)

See the [[06 HomeLab/Services/Service Catalog|Service Catalog]] for deployment details, supporting containers, and local ports.

## Architecture

```text
Internet
  └─ Router port forwarding (80/443)
      └─ Ryzen-2404 / Traefik
          ├─ Local Docker services on Ryzen-2404
          ├─ AorusServer: Home Inventory and Open WebUI/Ollama
          └─ HP-serv: Homarr and n8n

Home network
  ├─ LAN-only SSH administration for all servers
  └─ Ryzen-2404 Samba share → desktop computer and MacBook
```

## Operations

- [[06 HomeLab/Operations/Docker and Deployment|Docker and Deployment]] — current SSH/Compose workflow and future-management requirements
- [[06 HomeLab/Operations/Backups and Recovery|Backups and Recovery]] — current risk, backup priorities, and restore requirements
- [[06 HomeLab/Operations/Monitoring and Alerts|Monitoring and Alerts]] — future outage, host, storage, certificate, and backup alerting
- [[06 HomeLab/Network and Storage/Network and Remote Access|Network and Remote Access]] — public traffic flow, routes, middleware, and security checklist
- [[06 HomeLab/Network and Storage/Storage and File Sharing|Storage and File Sharing]] — disks, Samba use, and information still to capture

## Improvement queue

1. **Protect the data:** implement and test backups.
2. **Detect failures:** add server, service, disk, certificate, and backup alerts.
3. **Simplify operations:** centralize container visibility while retaining Compose as the source of truth.
4. **Review exposure:** verify authentication and middleware for all public services.
5. **Repair GPU support:** fix the AorusServer NVIDIA driver/library mismatch and verify Ollama acceleration.
6. **Finish storage documentation:** review the unused Ryzen SSD and record Samba/mount configuration.

Track details in [[06 HomeLab/Operations/Planned Improvements|Planned Improvements]].

## Documentation rules

- Update the server note and Service Catalog whenever a workload moves or changes.
- Record Compose folder paths, persistent data, update steps, verification, and rollback for each important stack.
- Never store passwords, recovery codes, private keys, API keys, or complete secret-bearing environment files in ordinary notes.
- Treat a backup as incomplete until a restore has been tested.

Return to [[Home]].
