---
title: Blue Springs Lawn Local Website
location: Blue Springs, Missouri
tags:
  - gardening
  - lawn
  - docker
status: active
---

# Blue Springs Lawn Local Website

The interactive companion to [[Blue Springs Lawn Action Calendar]] and [[Blue Springs Lawn Renovation Playbook]] runs only on this Mac in Docker. It is not published on ChatGPT Sites.

## Open the field guide

[Open the Blue Springs Lawn Field Guide](http://localhost:3080)

Bookmark that address in the browser. The page stores completed checkboxes on this browser/device; clearing browser storage resets them.

> [!note] Availability
> Docker Desktop must be running. The container is configured to restart automatically while Docker is available, and it listens only on this laptop (`127.0.0.1`). Other devices on the network cannot open it.

## Website source

`/Users/jkenney/Obsidian/James Knowledge Hub/05 Websites/Blue Springs Lawn Plan`

## Start or rebuild

Open Terminal and paste:

```bash
cd "/Users/jkenney/Obsidian/James Knowledge Hub/05 Websites/Blue Springs Lawn Plan"
docker compose up -d --build
```

Then open [http://localhost:3080](http://localhost:3080).

## Stop it

```bash
cd "/Users/jkenney/Obsidian/James Knowledge Hub/05 Websites/Blue Springs Lawn Plan"
docker compose down
```

Stopping the container does not delete the site files or browser checklist progress.

## Check its status

```bash
cd "/Users/jkenney/Obsidian/James Knowledge Hub/05 Websites/Blue Springs Lawn Plan"
docker compose ps
```

The expected result is one `lawn-field-guide` service marked `Up` or `running`, with `127.0.0.1:3080->3000/tcp` shown for its port.

## Troubleshooting

- If the page does not open, start Docker Desktop and rerun the start command.
- If port `3080` is already in use, change the left side of `127.0.0.1:3080:3000` in `compose.yaml`, rebuild, and use the matching localhost address.
- To view recent application messages, run `docker compose logs --tail=100 lawn-field-guide` from the website source folder.

## Related lawn records

- [[Blue Springs Lawn Action Calendar]] — dated work schedule and next actions
- [[Blue Springs Lawn Renovation Playbook]] — diagnosis, species, renovation, leveling, irrigation, products, and three-year strategy
