---
type: reference
status: planned
area: homelab
created: 2026-07-31
updated: 2026-07-31
---

# Backups and Recovery

> [!danger] Current state
> No backups are currently configured for the three servers, Docker application data, databases, configuration, or the 10TB Samba media share. A successful backup process must include tested restoration—not only scheduled copies.

## Recovery priorities

| Priority | Data | Why |
|---|---|---|
| Critical | Vaultwarden data and configuration | Password-vault loss can affect access to everything else |
| Critical | Traefik configuration and certificate state | Required to restore public routing |
| Critical | Gitea repositories and MySQL database | Source code and Git history |
| High | Home Inventory database and stored files | Personal inventory records and uploads |
| High | n8n workflows, credentials store, and encryption configuration | Automations may be unrecoverable without matching keys/configuration |
| High | Custom-app PostgreSQL/MySQL databases | Trading Journal, Training Portal, StreamPulse, Sable Iron Studio |
| High | Docker Compose files and non-secret configuration | Rebuild source of truth |
| High | Secret files and recovery material | Store securely outside ordinary Obsidian notes |
| Medium | Homarr, media-manager, and download-client configuration | Time-consuming to recreate |
| Size-dependent | `/home/jkenney/Media` Samba share | Largest dataset; backup design depends on available destination and tolerance for loss |
| Low | Replaceable container images and Ubuntu packages | Can normally be downloaded again |

## Desired backup standard

- Follow a 3-2-1 pattern where practical: three copies, two storage types, one off-site.
- Encrypt backups containing credentials or personal data.
- Keep databases transactionally consistent; do not rely only on copying live database files.
- Use retention that includes daily, weekly, and monthly restore points.
- Alert when a scheduled backup fails.
- Perform and record a sample restore at least quarterly.
- Keep credentials, private keys, and recovery codes out of ordinary vault notes.

## Decisions needed

- [ ] Select local backup storage and capacity.
- [ ] Select an off-site or removable destination.
- [ ] Decide how much of the 10TB media collection must be backed up.
- [ ] Choose a backup tool that supports encryption, retention, and verification.
- [ ] Inventory every persistent Docker volume and bind mount.
- [ ] Write database-dump procedures for PostgreSQL and MySQL stacks.
- [ ] Define recovery-time and acceptable-data-loss targets for critical services.

## Restore-test record

| Date | Backup set | Restore target | Result | Notes |
|---|---|---|---|---|
| Not yet tested | — | — | — | Backup system not yet implemented |

## Related

- [[06 HomeLab/Network and Storage/Storage and File Sharing|Storage and File Sharing]]
- [[06 HomeLab/Operations/Docker and Deployment|Docker and Deployment]]
- [[06 HomeLab/Operations/Planned Improvements|Planned Improvements]]

Return to [[06 HomeLab/HomeLab Dashboard|HomeLab Dashboard]].
