---
type: reference
status: active
area: homelab
created: 2026-07-31
updated: 2026-07-31
---

# Network and Remote Access

## Known server addresses

| Server | Static LAN address | Primary network role |
|---|---|---|
| [[06 HomeLab/Servers/AorusServer|AorusServer]] | `10.0.0.136` | AI and Home Inventory |
| [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | `10.0.0.56` | Reverse proxy, primary applications, media, and file sharing |
| [[06 HomeLab/Servers/HP-serv|HP-serv]] | `10.0.0.71` | Secondary applications and automation |

The router model, subnet mask, DNS provider, DHCP range, VLANs, and network-equipment inventory have not yet been recorded.

## Public request path

```text
Internet
  → router port forwarding for 80/443
  → Traefik on Ryzen-2404
  → Docker service on Ryzen-2404 or LAN service on AorusServer/HP-serv
```

- Traefik uses the `websecure` entry point for public HTTPS routes.
- Traefik has ACME certificate handling configured; the issuer and renewal procedure are not yet documented.
- The Traefik file provider routes selected services hosted on AorusServer and HP-serv.
- SSH is LAN-only and is not intentionally exposed to the public internet.

## Public routes

| Hostname | Destination service | Server |
|---|---|---|
| `traefik.jamesdkenney.com` | Traefik dashboard/API | Ryzen-2404 |
| `git.jamesdkenney.com` | Gitea | Ryzen-2404 |
| `links.jamesdkenney.com` | Homarr | HP-serv |
| `home.jamesdkenney.com` | Home Inventory | AorusServer |
| `jellyfin.jamesdkenney.com` | Jellyfin | Ryzen-2404 |
| `lidarr.jamesdkenney.com` | Lidarr | Ryzen-2404 |
| `n8n.jamesdkenney.com` | n8n | HP-serv |
| `ai.jamesdkenney.com` | Open WebUI | AorusServer |
| `jamesdkenney.com` | Photography Site | Ryzen-2404 |
| `pistol.jamesdkenney.com` | Pistol League | Ryzen-2404 |
| `radarr.jamesdkenney.com` | Radarr | Ryzen-2404 |
| `mealie.jamesdkenney.com` | Recipe App | Ryzen-2404 |
| `sonarr.jamesdkenney.com` | Sonarr | Ryzen-2404 |
| `streampulse.jamesdkenney.com` | StreamPulse | Ryzen-2404 |
| `journal.jamesdkenney.com` | Futures Trading Journal | Ryzen-2404 |
| `train.jamesdkenney.com` | Training Portal | Ryzen-2404 |
| `vault.jamesdkenney.com` | Vaultwarden | Ryzen-2404 |

## Observed Traefik middleware

- `dashboard-auth@file` — Basic Authentication middleware exists; verify that the public dashboard router uses it.
- `security-headers@file` — security-headers middleware exists; verify which public routers use it.
- Two internal dashboard middlewares handle redirect and path stripping.

## Security review checklist

- [ ] Confirm every public service requires appropriate authentication.
- [ ] Confirm the Traefik dashboard is protected and decide whether it needs to remain public.
- [ ] Verify security headers on every public route.
- [ ] Record the DNS provider and certificate-renewal behavior.
- [ ] Confirm router forwarding is limited to the intended ports.
- [ ] Decide whether administration-oriented services such as Sonarr, Radarr, Lidarr, n8n, and Gitea need direct public exposure.
- [ ] Document account recovery without placing secrets in the vault.

## Related

- [[06 HomeLab/Services/Service Catalog|Service Catalog]]
- [[06 HomeLab/Network and Storage/Storage and File Sharing|Storage and File Sharing]]
- [[06 HomeLab/Operations/Planned Improvements|Planned Improvements]]

Return to [[06 HomeLab/HomeLab Dashboard|HomeLab Dashboard]].
