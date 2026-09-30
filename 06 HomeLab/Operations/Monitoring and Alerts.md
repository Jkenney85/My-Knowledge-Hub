---
type: reference
status: planned
area: homelab
created: 2026-07-31
updated: 2026-07-31
---

# Monitoring and Alerts

## Current state

- No server or service outage alerts are configured.
- Speedtest Tracker runs on Ryzen-2404, but it measures internet performance rather than detecting every service failure.
- Container health checks exist for some services, but there is no centralized notification path.

## Monitoring coverage to add

### Availability

- All three Ubuntu hosts
- Every public HTTPS route
- LAN-only critical services, including Ollama and Samba
- Traefik itself from both LAN and external perspectives

### Host health

- CPU load and temperature
- Memory and swap pressure
- Disk-space consumption
- SMART health and disk errors
- Reboots and host uptime
- Pending security updates

### Container health

- Unexpected stopped or restarting containers
- Docker health-check failures
- Database availability
- Repeated application errors

### Backup health

- Failed or missed backup jobs
- Stale backup age
- Repository integrity/check results
- Scheduled restore-test reminders

## Alerting principles

- Send actionable alerts, not constant low-value noise.
- Distinguish urgent public outages from maintenance warnings.
- Include the affected server, service, time, and first troubleshooting link.
- Add maintenance windows so planned restarts do not create false alarms.
- Test the notification path after setup and periodically afterward.

## Decisions needed

- [ ] Select the monitoring system.
- [ ] Select the alert destination.
- [ ] Decide whether monitoring should run on an existing server or a separate low-power device.
- [ ] Define disk, memory, certificate-expiry, and outage thresholds.
- [ ] Create a public-route and LAN-service check list from the [[06 HomeLab/Services/Service Catalog|Service Catalog]].

Return to [[06 HomeLab/HomeLab Dashboard|HomeLab Dashboard]].
