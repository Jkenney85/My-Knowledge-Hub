---
type: reference
status: active
area: homelab
created: 2026-07-31
updated: 2026-07-31
---

# Storage and File Sharing

## Samba media share

| Item | Value |
|---|---|
| Server | [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] |
| Physical disk | `sdb` — WD WD100EFGX-68 |
| Usable size shown by Linux | 9.1 TiB |
| Filesystem | NTFS |
| Mount point | `/home/jkenney/Media` |
| Sharing protocol | Samba/SMB |
| Clients | Desktop computer and MacBook |
| Backup status | No backup currently configured |

## Information still to capture

- Samba share name and client mount paths
- Why NTFS was selected and whether it is still required
- `/etc/fstab` entry or other mount mechanism
- Samba configuration location and share definition
- Ownership, permissions, and allowed users
- Disk-health monitoring and SMART-test schedule
- Storage-consumption alert threshold
- Replacement and recovery procedure

## Other server storage

| Server | Device | Use/status |
|---|---|---|
| [[06 HomeLab/Servers/AorusServer|AorusServer]] | Samsung 970 EVO Plus 250GB NVMe | Ubuntu system disk and Docker data |
| [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | WD 512GB NVMe | Ubuntu system disk and Docker data |
| [[06 HomeLab/Servers/Ryzen-2404|Ryzen-2404]] | Samsung 860 500GB SSD | ext4; no mount point observed; purpose needs review |
| [[06 HomeLab/Servers/HP-serv|HP-serv]] | Samsung 850 EVO 250GB SSD | Ubuntu system disk and Docker data |

## Recovery status

The HomeLab currently has no documented restore path for the media share or Docker data. Treat the media disk and each server's application data as single-copy data until [[06 HomeLab/Operations/Backups and Recovery|Backups and Recovery]] is implemented and tested.

Return to [[06 HomeLab/HomeLab Dashboard|HomeLab Dashboard]].
