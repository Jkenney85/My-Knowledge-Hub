---
type: guide
status: active
area: homelab
created: 2026-07-31
updated: 2026-07-31
---

# Docker and Deployment

## Current operating model

- Every server runs Docker containers.
- Application stacks live in separate Docker Compose folders.
- Administration and deployments are performed manually over LAN-only SSH.
- Compose folder paths, source repositories, environment-file locations, and update procedures have not yet been cataloged.
- There is no centralized container manager or failure-alerting system.

## Server summary

| Server | Docker role |
|---|---|
| [[06 HomeLab/Servers/AorusServer|AorusServer]] | Home Inventory and Open WebUI |
| [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Traefik, most applications, media stack, source control, and monitoring utility |
| [[06 HomeLab/Servers/HP-serv|HP-serv]] | Sable Iron Studio, Homarr, and n8n |

## Stack inventory fields

Capture these fields for each Compose stack as it is reviewed:

- Compose folder
- Repository or source location
- Compose project name
- Public URL and local port
- Required Docker networks
- Persistent volumes and bind mounts
- Database engine and database-backup command
- Environment-file location without copying secrets into Obsidian
- Safe update command
- Verification steps
- Rollback method
- Special startup dependencies

## Safe manual update checklist

Use this as a general checklist only; each important stack should eventually have its own tested runbook.

1. Read the application's release notes for breaking changes.
2. Confirm that configuration, volumes, and databases have a recent usable backup.
3. Connect over the home network with SSH.
4. Change to the recorded Compose folder.
5. Review the resolved Compose configuration without exposing secrets in notes or screenshots.
6. Pull or build the intended version.
7. Recreate the stack.
8. Check container health and recent logs.
9. Test the local service first, then its Traefik URL.
10. Record the date, version, result, and rollback used if applicable.

## Central-management requirements

The future management approach should:

- Preserve Docker Compose as the source of truth.
- Provide one clear view across all three servers.
- Make status, logs, restarts, and controlled updates easier.
- Avoid storing Compose definitions only inside a management tool.
- Work with existing Traefik routing and external Docker networks.
- Support backup of its own configuration.
- Avoid automatic unattended major-version upgrades.

See [[06 HomeLab/Operations/Planned Improvements|Planned Improvements]] before selecting a tool.

## Related

- [[06 HomeLab/Services/Service Catalog|Service Catalog]]
- [[06 HomeLab/Operations/Backups and Recovery|Backups and Recovery]]
- [[06 HomeLab/Operations/Monitoring and Alerts|Monitoring and Alerts]]

Return to [[06 HomeLab/HomeLab Dashboard|HomeLab Dashboard]].
