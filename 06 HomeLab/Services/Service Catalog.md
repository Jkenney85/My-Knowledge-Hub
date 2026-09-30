---
type: reference
status: active
area: homelab
created: 2026-07-31
updated: 2026-07-31
---

# Service Catalog

This catalog tracks user-facing services and major application stacks. Supporting databases and APIs are grouped with their parent application so the dashboard stays readable.

## Public HTTPS services

| Service | Host | Deployment | Public URL | Notes |
|---|---|---|---|---|
| Traefik dashboard | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Docker | [traefik.jamesdkenney.com](https://traefik.jamesdkenney.com) | Public administration surface; verify authentication and middleware |
| Gitea | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Docker + MySQL | [git.jamesdkenney.com](https://git.jamesdkenney.com) | Web on port 3000; SSH service on port 222 |
| Homarr | [[06 HomeLab/Servers/HP-serv|HP-serv]] | Docker | [links.jamesdkenney.com](https://links.jamesdkenney.com) | Local port 7575; routed by Traefik file provider |
| Home Inventory | [[06 HomeLab/Servers/AorusServer|AorusServer]] | Docker stack | [home.jamesdkenney.com](https://home.jamesdkenney.com) | Local Nginx gateway on port 8181 |
| Open WebUI | [[06 HomeLab/Servers/AorusServer|AorusServer]] | Docker + host Ollama | [ai.jamesdkenney.com](https://ai.jamesdkenney.com) | Routed by Traefik file provider |
| n8n | [[06 HomeLab/Servers/HP-serv|HP-serv]] | Docker | [n8n.jamesdkenney.com](https://n8n.jamesdkenney.com) | Local port 5678; routed by Traefik file provider |
| Photography Site | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Docker | [jamesdkenney.com](https://jamesdkenney.com) | Local port 8085 |
| Pistol League | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Docker | [pistol.jamesdkenney.com](https://pistol.jamesdkenney.com) | Local port 3030 |
| Recipe App / Mealie | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Docker frontend + backend | [mealie.jamesdkenney.com](https://mealie.jamesdkenney.com) | Frontend local port 9925 |
| StreamPulse | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Docker + PostgreSQL | [streampulse.jamesdkenney.com](https://streampulse.jamesdkenney.com) | Container stack is named `stream-tracker-v2` |
| Futures Trading Journal | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Docker + PostgreSQL | [journal.jamesdkenney.com](https://journal.jamesdkenney.com) | App listens internally on port 3000 |
| Training Portal | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Docker frontend + backend + PostgreSQL | [train.jamesdkenney.com](https://train.jamesdkenney.com) | Frontend local port 8081 |
| Vaultwarden | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Docker | [vault.jamesdkenney.com](https://vault.jamesdkenney.com) | Local port 90 |
| Jellyfin | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Docker | [jellyfin.jamesdkenney.com](https://jellyfin.jamesdkenney.com) | Local port 8096 |
| Sonarr | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Docker | [sonarr.jamesdkenney.com](https://sonarr.jamesdkenney.com) | Local port 8989 |
| Radarr | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Docker | [radarr.jamesdkenney.com](https://radarr.jamesdkenney.com) | Local port 7878 |
| Lidarr | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Docker | [lidarr.jamesdkenney.com](https://lidarr.jamesdkenney.com) | Local port 8686 |

## LAN and internal services

| Service | Host | Access | Notes |
|---|---|---|---|
| Ollama | [[06 HomeLab/Servers/AorusServer|AorusServer]] | Host system service | Used by Open WebUI; GPU use needs verification |
| Samba file share | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Home network | Shares `/home/jkenney/Media` with desktop and MacBook |
| Plex | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Port 32400 and Plex connectivity | No Traefik route observed |
| Prowlarr | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | `10.0.0.56:9696` | No Traefik route observed |
| Transmission | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | `10.0.0.56:9091` | Peer ports 51413 TCP/UDP |
| SABnzbd | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | `10.0.0.56:8088` | No Traefik route observed |
| Speedtest Tracker | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | `10.0.0.56:8585` or `:8443` | Measures connectivity; not an uptime alerting system |
| Sable Iron Studio | [[06 HomeLab/Servers/HP-serv|HP-serv]] | `10.0.0.71:3000` | App + PostgreSQL + Mailpit; no Traefik route observed |
| Mailpit | [[06 HomeLab/Servers/HP-serv|HP-serv]] | `10.0.0.71:8025` | Development/test mail UI; SMTP on port 1025 |

## Supporting containers

| Application | Components |
|---|---|
| Home Inventory | App, Supabase Auth, Nginx gateway, Supabase Storage API, PostgREST, Supabase PostgreSQL, one-time bootstrap and migration jobs |
| Futures Trading Journal | Application and PostgreSQL 16 |
| Training Portal | Frontend, backend, and PostgreSQL 15 |
| StreamPulse | Web application and PostgreSQL 16 |
| Gitea | Gitea 1.23.7 and MySQL 8 |
| Sable Iron Studio | Application, PostgreSQL 16, and Mailpit |

## Catalog maintenance

Update this note when a service is added, removed, moved, renamed, or changes its public access. Do not store passwords, tokens, private keys, API keys, or recovery codes here.

## Related

- [[06 HomeLab/Network and Storage/Network and Remote Access|Network and Remote Access]]
- [[06 HomeLab/Operations/Docker and Deployment|Docker and Deployment]]
- [[06 HomeLab/Operations/Backups and Recovery|Backups and Recovery]]

Return to [[06 HomeLab/HomeLab Dashboard|HomeLab Dashboard]].
