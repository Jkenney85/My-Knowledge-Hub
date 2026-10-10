# Ubuntu 26.04 application setup

This script installs the requested applications after Ubuntu is installed on your main drive. It is for standard Ubuntu 26.04 Desktop on an Intel/AMD 64-bit computer. It does not install Ubuntu, format drives, or copy data from the test drive.

Copy this folder to a USB drive or another location you will retain before replacing your main-drive operating system. After installing Ubuntu, copy `install-apps.sh` into your Downloads folder. Open Terminal and run:

```bash
bash ~/Downloads/install-apps.sh
```

Run as your normal user; the script asks for your password when administrative access is needed. Internet access is required. It first updates Ubuntu's package list and upgrades installed system packages before running any app installers. Steam or other package installers may present license or setup prompts. Keep Terminal open until it reports **Installation complete**. If anything fails, the script stops and records the error; fix that error and rerun it.

## What it installs

| Application | Installation source |
| --- | --- |
| ChatGPT | Official latest amd64 Debian package; Linux preview |
| Claude Desktop | Anthropic's signed apt repository; Linux beta |
| Obsidian | Publisher Snap package, with classic access for your vaults |
| GNOME Tweaks | Ubuntu package |
| GNOME Extension Manager | Ubuntu package |
| gTile | GNOME Extensions release matching your GNOME Shell version |
| TradingView | Official publisher Snap package |
| PhotoCraft | Latest official x86_64 Debian package from the ArtCraft team's GitHub releases; verified SHA-256 checksum |
| FilmCraft | Latest official x86_64 Debian package from the ArtCraft team's GitHub releases; verified SHA-256 checksum |
| LightCraft | Latest official x86_64 Debian package from the ArtCraft team's GitHub releases; verified SHA-256 checksum |
| Steam | Valve's native apt package |
| ProtonPlus | Project's recommended Flathub package, installed for your user |
| GE-Proton | Latest stable upstream GitHub release when the script runs; x86_64 build, verified against its published SHA-512 checksum |

The initial update uses `apt-get update` and `apt-get upgrade -y --with-new-pkgs`, the script-friendly equivalents of `apt update` and `apt upgrade`. New dependencies are allowed; installed packages are not removed as part of this upgrade. If Ubuntu requests a reboot, the script reminds you at the end.

The script then enables Ubuntu's universe and multiverse repositories, adds i386 package support for Steam, and installs the supporting package tools. It adds the Claude and Valve signed repositories; the ChatGPT installer configures OpenAI's update repository.

PhotoCraft, FilmCraft, and LightCraft use their own standalone `.deb` installers linked from ArtCraft's apps pages. The script resolves the latest non-prerelease GitHub release when run, verifies the downloaded package against that release's `SHA256SUMS.txt`, checks its package name and architecture, and installs it with apt so dependencies are included. It installs these three apps without the ArtCraft Launcher. Their standalone installers do not provide the Launcher's automatic update management; rerun the script to install newer releases. ArtCraft currently describes these as early alpha or in-development apps.

GE-Proton is installed directly into native Steam's `compatibilitytools.d` folder so this works before Steam's first launch. ProtonPlus can then discover and manage it. Installation does not select GE-Proton for existing games or automatically update it on a schedule.

On a fresh install, the target is `~/.local/share/Steam/compatibilitytools.d`. Existing native Steam locations are respected. Steam Snap and Steam Flatpak use other folders; this setup intentionally installs native Steam. It does not migrate existing games from another Steam installation.

## After the script finishes

1. Reboot if the script reports that Ubuntu requires it; otherwise log out and log back in, or reboot. This loads gTile and refreshes application shortcuts.
2. Open **Extension Manager** and confirm gTile is enabled. If GNOME's global extensions switch was already off, turn it on.
3. Open ChatGPT, Claude, and TradingView and sign in. In Obsidian, open your existing vault or create one.
4. Open Steam, let its first-run download finish, and sign in.
5. For a game that needs GE-Proton, open **Properties → Compatibility**, check **Force the use of a specific Steam Play compatibility tool**, and choose the installed **GE-Proton** version. Restart Steam if the version does not appear.
6. Open **ProtonPlus** to manage future releases. Steam must have been opened at least once for reliable launcher detection.

For a later GE-Proton update, you can use ProtonPlus or rerun this script. Reruns add new GE-Proton versions alongside old ones; they preserve your existing games' compatibility choices. Updates to apt and Snap apps follow their normal package mechanisms. Update ProtonPlus through Flatpak or rerun the script.

Logs are saved in `~/.local/state/ubuntu-app-setup/` unless you have configured a different XDG state directory. Failed GE-Proton extraction can leave a staging folder named `.ubuntu-setup.*` inside `compatibilitytools.d`; its path is printed for review. The script will not overwrite an incomplete existing GE-Proton version folder.

## Verification and limits

Prepared on October 10, 2026. Official download metadata and installation instructions were checked. The script's shell syntax, embedded Python syntax, current gTile archive metadata, current GE-Proton archive folder, release asset selection, checksum format, and Claude signing-key fingerprint were checked without installing applications. Local tests confirmed rejection of prereleases, corrupt downloads, unsafe archive paths, and archives missing Steam's compatibility manifest. A complete installation has not been run on a fresh Ubuntu machine; package availability and upstream services can change.

The added ArtCraft apps' live release metadata, checksum entries, and actual Debian package control metadata were checked. All three packages identify themselves with the expected app name and `amd64` architecture. Their download selection and checksum checks were tested against real release metadata and local valid/corrupt samples. No system upgrade or application installation was run while preparing this revision.

## Official references

- [ChatGPT Linux installation](https://learn.chatgpt.com/docs/linux/linux-app)
- [Claude Desktop installation](https://support.claude.com/en/articles/10065433-install-claude-desktop)
- [Obsidian publisher Snap package](https://snapcraft.io/obsidian)
- [Ubuntu Extension Manager package](https://packages.ubuntu.com/resolute/gnome-shell-extension-manager)
- [gTile extension and supported GNOME versions](https://extensions.gnome.org/extension/28/gtile/)
- [gTile installation instructions](https://github.com/gTile/gTile)
- [TradingView Linux installation](https://www.tradingview.com/support/solutions/43000728898-how-to-install-and-update-desktop-app-on-linux/)
- [ArtCraft apps](https://getartcraft.com/apps)
- [PhotoCraft standalone installers](https://getartcraft.com/apps/photocraft)
- [FilmCraft standalone installers](https://getartcraft.com/apps/filmcraft)
- [LightCraft standalone installers](https://getartcraft.com/apps/lightcraft)
- [Valve Steam repository](https://repo.steampowered.com/steam/)
- [ProtonPlus installation and usage](https://github.com/Vysp3r/ProtonPlus)
- [GE-Proton installation and enabling](https://github.com/GloriousEggroll/proton-ge-custom)
