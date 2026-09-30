---
type: roadmap
status: active
area: homelab
created: 2026-07-31
updated: 2026-07-31
---

# Planned Improvements

This is the HomeLab improvement queue. Promote an item to a full project note when you are ready to choose a solution and implement it.

## Priority 0 — protect the data

### Backup and recovery system

**Outcome:** Critical service data, configuration, databases, and selected media have encrypted, monitored backups with tested restoration.

- [ ] Decide what data on the 10TB media disk must be protected.
- [ ] Choose local and off-site/removable destinations.
- [ ] Inventory persistent Docker data.
- [ ] Implement database-aware backups.
- [ ] Back up Traefik, Vaultwarden, Gitea, Home Inventory, n8n, and custom applications first.
- [ ] Test and document restoration.

Reference: [[06 HomeLab/Operations/Backups and Recovery|Backups and Recovery]]

## Priority 1 — know when things break

### Monitoring and alerts

**Outcome:** Server, service, disk, certificate, and backup failures create actionable alerts.

- [ ] Select a monitoring system and notification channel.
- [ ] Monitor all public routes and three server hosts.
- [ ] Add storage, SMART, container, certificate, and backup checks.
- [ ] Test outage notifications.

Reference: [[06 HomeLab/Operations/Monitoring and Alerts|Monitoring and Alerts]]

## Priority 1 — simplify container operations

### Centralized container management

**Outcome:** All three servers can be viewed and safely operated from one place while Compose files remain the source of truth.

- [ ] Inventory Compose folder paths, repositories, volumes, and networks.
- [ ] Define requirements and compare management approaches.
- [ ] Pilot with a non-critical HP-serv workload.
- [ ] Document update, rollback, and recovery procedures.
- [ ] Move critical stacks only after the pilot is verified.

Reference: [[06 HomeLab/Operations/Docker and Deployment|Docker and Deployment]]

## Priority 1 — reduce public attack surface

### Public-access review

**Outcome:** Only intentionally public services remain exposed, with appropriate authentication and Traefik middleware.

- [ ] Verify protection on the public Traefik dashboard.
- [ ] Verify `security-headers@file` attachment.
- [ ] Review direct public exposure of Sonarr, Radarr, Lidarr, n8n, Gitea, and other administration surfaces.
- [ ] Record DNS, certificate, and router-forwarding configuration.

Reference: [[06 HomeLab/Network and Storage/Network and Remote Access|Network and Remote Access]]

## Priority 2 — repair and document hardware

### AorusServer GPU acceleration

**Outcome:** NVIDIA tooling works and Ollama GPU use is verified.

- [ ] Repair the NVIDIA driver/library mismatch.
- [ ] Confirm `nvidia-smi` works after reboot.
- [ ] Confirm an Ollama model uses the GTX 1060.

### Ryzen-2404 storage review

**Outcome:** Every attached disk has a documented purpose, mount configuration, health check, and protection plan.

- [ ] Identify the intended use of the unmounted Samsung 860 SSD.
- [ ] Record Samba and mount configuration.
- [ ] Add SMART and capacity monitoring.

Return to [[06 HomeLab/HomeLab Dashboard|HomeLab Dashboard]].
