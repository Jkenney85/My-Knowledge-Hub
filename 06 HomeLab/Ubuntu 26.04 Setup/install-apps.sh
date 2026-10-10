#!/usr/bin/env bash
# Post-install setup for Ubuntu 26.04 Desktop on an Intel/AMD (amd64) PC.
# Run as your desktop user: bash install-apps.sh
# --help prints instructions without making changes.
# Official installation references are in README.md beside this script.
set -Eeuo pipefail
umask 022

if [[ ${1:-} == --help ]]; then
    cat <<'HELP'
Usage: bash install-apps.sh

Run in Terminal as your normal user after installing Ubuntu 26.04 Desktop.
Updates and upgrades Ubuntu before installing applications.
Installs ChatGPT, Claude, Obsidian, GNOME Tweaks, Extension Manager, gTile,
TradingView, native Steam, ProtonPlus, and the latest stable GE-Proton.
Also installs PhotoCraft, FilmCraft, and LightCraft from official .deb files.
Requires internet access and sudo. Do not run the entire script with sudo.
This installs applications; it does not install Ubuntu or partition drives.
HELP
    exit 0
fi
[[ $# == 0 ]] || { printf 'Unknown option. Use --help.\n' >&2; exit 1; }
[[ $EUID != 0 ]] || { printf 'Run as your normal desktop user, without sudo.\n' >&2; exit 1; }
source /etc/os-release
[[ ${ID:-} == ubuntu && ${VERSION_ID:-} == 26.04 ]] || {
    printf 'This script requires Ubuntu 26.04 Desktop.\n' >&2; exit 1;
}
[[ $(dpkg --print-architecture) == amd64 ]] || {
    printf 'This script requires an Intel/AMD 64-bit PC (amd64).\n' >&2; exit 1;
}
[[ ! -d /rofs && ! -d /run/casper ]] || {
    printf 'Install Ubuntu first, then run this from the installed system.\n' >&2; exit 1;
}
command -v gnome-shell >/dev/null || {
    printf 'The standard Ubuntu GNOME desktop is required.\n' >&2; exit 1;
}
[[ -n ${DBUS_SESSION_BUS_ADDRESS:-} && -n ${XDG_RUNTIME_DIR:-} ]] || {
    printf 'Run this in Terminal while logged into your GNOME desktop.\n' >&2; exit 1;
}

log_dir="${XDG_STATE_HOME:-$HOME/.local/state}/ubuntu-app-setup"
mkdir -p "$log_dir"
log_file="$log_dir/$(date +%Y%m%d-%H%M%S).log"
exec > >(tee -a "$log_file") 2>&1
work_dir=$(mktemp -d /tmp/ubuntu-app-setup.XXXXXXXX)
cleanup() { rm -rf -- "$work_dir"; }
trap cleanup EXIT
trap 'printf "\nSetup stopped at line %s. See %s\nFix the reported error, then rerun the script.\n" "$LINENO" "$log_file" >&2' ERR

step() { printf '\n>>> %s\n' "$*"; }
download() {
    curl --proto '=https' --proto-redir '=https' --tlsv1.2 \
        --fail --location --show-error --retry 3 --connect-timeout 30 \
        --output "$2" "$1"
}
install_snap() {
    local app=$1
    shift
    if snap list "$app" >/dev/null 2>&1; then
        sudo snap refresh "$app"
    else
        sudo snap install "$app" "$@"
    fi
}

install_artcraft() {
    local app=$1
    local -a assets
    local package_path
    step "Finding the latest $app Debian package"
    download "https://api.github.com/repos/storytold/$app/releases/latest" \
        "$work_dir/$app-release.json"
    /usr/bin/python3 - "$app" "$work_dir/$app-release.json" "$work_dir/$app-assets.txt" <<'PY'
import json, re, sys
from urllib.parse import urlparse
app, release_path, output_path = sys.argv[1:]
with open(release_path) as f:
    release = json.load(f)
tag = release.get('tag_name', '')
if release.get('draft') or release.get('prerelease') or not re.fullmatch(r'[A-Za-z0-9._-]+', tag):
    raise SystemExit(f'No recognized release found for {app}.')
assets = release.get('assets', [])
packages = [a for a in assets if re.fullmatch(re.escape(app) + r'-[0-9][A-Za-z0-9.+-]*-linux-x86_64\.deb', a['name'])]
checksums = [a for a in assets if a['name'] == 'SHA256SUMS.txt']
if len(packages) != 1 or len(checksums) != 1:
    raise SystemExit(f'Expected one x86_64 Debian package and a checksum file for {app}.')
for asset in (packages[0], checksums[0]):
    url = urlparse(asset['browser_download_url'])
    expected_path = f'/storytold/{app}/releases/download/{tag}/{asset["name"]}'
    if url.scheme != 'https' or url.netloc != 'github.com' or url.path != expected_path or url.query or url.fragment:
        raise SystemExit(f'Unexpected download URL for {app}.')
with open(output_path, 'w') as f:
    f.write('\n'.join((packages[0]['name'], packages[0]['browser_download_url'], checksums[0]['browser_download_url'])) + '\n')
PY
    mapfile -t assets < "$work_dir/$app-assets.txt"
    package_path="$work_dir/${assets[0]}"
    download "${assets[1]}" "$package_path"
    download "${assets[2]}" "$work_dir/$app-SHA256SUMS.txt"
    /usr/bin/python3 - "$package_path" "$work_dir/$app-SHA256SUMS.txt" <<'PY'
import hashlib, re, sys
from pathlib import Path
package = Path(sys.argv[1])
matches = []
for line in Path(sys.argv[2]).read_text().splitlines():
    match = re.fullmatch(r'([0-9a-fA-F]{64})\s+\*?(.+)', line)
    if match and match[2] == package.name:
        matches.append(match[1].lower())
if len(matches) != 1:
    raise SystemExit(f'Expected one checksum for {package.name}.')
with package.open('rb') as f:
    digest = hashlib.file_digest(f, 'sha256').hexdigest()
if digest != matches[0]:
    raise SystemExit(f'Checksum verification failed for {package.name}.')
print(f'SHA-256 verification passed: {package.name}')
PY
    [[ $(dpkg-deb -f "$package_path" Package) == "$app" ]]
    [[ $(dpkg-deb -f "$package_path" Architecture) == amd64 ]]
    sudo apt-get install -y "$package_path"
}

step 'Updating and upgrading Ubuntu before installing applications'
sudo -v
sudo apt-get update
# Match apt upgrade behavior: permit new dependencies without removing packages.
sudo apt-get upgrade -y --with-new-pkgs

step 'Installing package tools and enabling Ubuntu application repositories'
sudo apt-get install -y ca-certificates curl gnupg jq python3 python3-gi \
    software-properties-common flatpak snapd
sudo add-apt-repository -y -n universe
sudo add-apt-repository -y -n multiverse
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install -y gnome-tweaks gnome-shell-extension-manager

step 'Installing ChatGPT from the official Linux download'
download 'https://persistent.oaistatic.com/codex-app-prod/linux/deb/latest/chatgpt_amd64.deb' \
    "$work_dir/chatgpt_amd64.deb"
[[ $(dpkg-deb -f "$work_dir/chatgpt_amd64.deb" Package) == chatgpt ]]
[[ $(dpkg-deb -f "$work_dir/chatgpt_amd64.deb" Architecture) == amd64 ]]
sudo apt-get install -y "$work_dir/chatgpt_amd64.deb"

step 'Installing Claude from the official signed repository'
download 'https://downloads.claude.ai/claude-desktop/key.asc' "$work_dir/claude-key.asc"
mkdir -m 700 "$work_dir/gnupg"
claude_fingerprint=$(gpg --homedir "$work_dir/gnupg" --batch --with-colons \
    --show-keys "$work_dir/claude-key.asc" | awk -F: '$1 == "fpr" {print $10; exit}')
[[ $claude_fingerprint == 31DDDE24DDFAB679F42D7BD2BAA929FF1A7ECACE ]] || {
    printf 'Claude signing key differs from the documented key; setup stopped.\n' >&2
    exit 1
}
sudo install -m 644 "$work_dir/claude-key.asc" /usr/share/keyrings/claude-desktop-archive-keyring.asc
printf '%s\n' 'deb [arch=amd64 signed-by=/usr/share/keyrings/claude-desktop-archive-keyring.asc] https://downloads.claude.ai/claude-desktop/apt/stable stable main' \
    | sudo tee /etc/apt/sources.list.d/claude-desktop.list >/dev/null
sudo apt-get update
sudo apt-get install -y claude-desktop

step 'Installing Obsidian and TradingView from their publisher Snap packages'
sudo systemctl start snapd.socket
sudo snap wait system seed.loaded
install_snap obsidian --classic
install_snap tradingview

step 'Installing PhotoCraft, FilmCraft, and LightCraft'
install_artcraft photocraft
install_artcraft filmcraft
install_artcraft lightcraft

step 'Installing native Steam from Valve'
download 'https://repo.steampowered.com/steam/archive/stable/steam.gpg' "$work_dir/steam.gpg"
sudo install -m 644 "$work_dir/steam.gpg" /usr/share/keyrings/steam.gpg
printf '%s\n' 'deb [arch=amd64,i386 signed-by=/usr/share/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam' \
    | sudo tee /etc/apt/sources.list.d/steam-stable.list >/dev/null
sudo apt-get update
sudo apt-get install -y steam-launcher

step 'Installing ProtonPlus from Flathub for your user'
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user -y --noninteractive flathub com.vysp3r.ProtonPlus
flatpak update --user -y --noninteractive com.vysp3r.ProtonPlus

step 'Finding the latest stable GE-Proton release'
download 'https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest' \
    "$work_dir/proton-release.json"
# Prefer the explicit x86_64 build; also accept the older unsuffixed format.
/usr/bin/python3 - "$work_dir/proton-release.json" "$work_dir/proton-assets.txt" <<'PY'
import json, re, sys
from urllib.parse import urlparse
with open(sys.argv[1]) as f:
    release = json.load(f)
tag = release.get('tag_name', '')
if release.get('prerelease') or release.get('draft') or not re.fullmatch(r'GE-Proton\d+-\d+', tag):
    raise SystemExit('No recognized stable GE-Proton release found.')
assets = {a['name']: a['browser_download_url'] for a in release.get('assets', [])}
archive = next((n for n in (tag + '-x86_64.tar.gz', tag + '.tar.gz') if n in assets), None)
if not archive:
    raise SystemExit('No x86_64 GE-Proton archive found.')
checksum = archive.removesuffix('.tar.gz') + '.sha512sum'
if checksum not in assets:
    raise SystemExit('No matching GE-Proton checksum found.')
for name in (archive, checksum):
    url = urlparse(assets[name])
    if url.scheme != 'https' or url.netloc != 'github.com' or not url.path.lower().startswith('/gloriouseggroll/proton-ge-custom/releases/download/'):
        raise SystemExit('Unexpected GE-Proton download URL.')
with open(sys.argv[2], 'w') as f:
    f.write('\n'.join((tag, archive, assets[archive], assets[checksum])) + '\n')
PY
mapfile -t proton_assets < "$work_dir/proton-assets.txt"
proton_tag=${proton_assets[0]}
proton_archive=${proton_assets[1]}
proton_folder=${proton_archive%.tar.gz}
# Respect existing native Steam locations, including symlinks created by Steam.
steam_dir="$HOME/.local/share/Steam"
for candidate in "$HOME/.steam/root" "$HOME/.steam/steam" "$HOME/.local/share/Steam"; do
    if [[ -d $candidate ]]; then
        steam_dir=$(readlink -f "$candidate")
        break
    fi
done
compat_dir="$steam_dir/compatibilitytools.d"
mkdir -p "$compat_dir"
if [[ -f "$compat_dir/$proton_folder/compatibilitytool.vdf" ]]; then
    printf '%s is already installed.\n' "$proton_tag"
else
    [[ ! -e "$compat_dir/$proton_folder" && ! -L "$compat_dir/$proton_folder" ]] || {
        printf 'An incomplete GE-Proton folder already exists: %s\nReview it before rerunning.\n' "$compat_dir/$proton_folder" >&2
        exit 1
    }
    step "Downloading and verifying $proton_tag (this can be a large download)"
    download "${proton_assets[2]}" "$work_dir/$proton_archive"
    download "${proton_assets[3]}" "$work_dir/proton.sha512sum"
    /usr/bin/python3 - "$work_dir/proton.sha512sum" "$work_dir/$proton_archive" <<'PY'
import hashlib, re, sys
from pathlib import Path
checksum = Path(sys.argv[1]).read_text().strip()
match = re.fullmatch(r'([0-9a-fA-F]{128})\s+\*?(.+)', checksum)
archive = Path(sys.argv[2])
if not match or match[2] != archive.name:
    raise SystemExit('Unexpected GE-Proton checksum format or filename.')
with archive.open('rb') as f:
    digest = hashlib.file_digest(f, 'sha512').hexdigest()
if digest != match[1].lower():
    raise SystemExit('GE-Proton checksum verification failed.')
print('GE-Proton SHA-512 verification passed.')
PY
    # Stage on the destination filesystem. Python's data filter blocks unsafe
    # archive paths and links, and prevents a partially extracted final install.
    stage_dir=$(mktemp -d "$compat_dir/.ubuntu-setup.XXXXXXXX")
    if /usr/bin/python3 - "$work_dir/$proton_archive" "$stage_dir" "$proton_folder" <<'PY'
import sys, tarfile
from pathlib import Path, PurePosixPath
archive, staging, tag = sys.argv[1:]
with tarfile.open(archive, 'r:gz') as bundle:
    for member in bundle.getmembers():
        parts = PurePosixPath(member.name).parts
        if not parts or parts[0] != tag:
            raise SystemExit('GE-Proton archive has an unexpected root directory.')
    bundle.extractall(staging, filter='data')
if not (Path(staging) / tag / 'compatibilitytool.vdf').is_file():
    raise SystemExit('GE-Proton archive is missing compatibilitytool.vdf.')
PY
    then
        mv -T -- "$stage_dir/$proton_folder" "$compat_dir/$proton_folder"
        rmdir -- "$stage_dir"
    else
        printf 'GE-Proton extraction failed. Staging folder retained: %s\n' "$stage_dir" >&2
        exit 1
    fi
fi

step 'Installing gTile for the running GNOME Shell version'
shell_version=$(gnome-shell --version | awk '{print $NF}')
shell_major=${shell_version%%.*}
[[ $shell_major =~ ^[0-9]+$ ]]
download "https://extensions.gnome.org/extension-info/?uuid=gTile%40vibou&shell_version=$shell_major" \
    "$work_dir/gtile-info.json"
version_tag=$(jq -er --arg shell "$shell_major" '.shell_version_map[$shell].pk | numbers' "$work_dir/gtile-info.json")
[[ $version_tag =~ ^[0-9]+$ ]] || {
    printf 'No compatible gTile version found for GNOME %s.\n' "$shell_major" >&2; exit 1;
}
download "https://extensions.gnome.org/download-extension/gTile%40vibou.shell-extension.zip?version_tag=$version_tag" \
    "$work_dir/gtile.shell-extension.zip"
/usr/bin/python3 - "$work_dir/gtile.shell-extension.zip" "$shell_major" <<'PY'
import json, sys, zipfile
with zipfile.ZipFile(sys.argv[1]) as bundle:
    info = json.loads(bundle.read('metadata.json'))
if info.get('uuid') != 'gTile@vibou' or sys.argv[2] not in info.get('shell-version', []):
    raise SystemExit('Downloaded gTile does not match this GNOME version.')
PY
gnome-extensions install --force "$work_dir/gtile.shell-extension.zip"
# A newly installed extension becomes visible to GNOME only after a new login.
# Add only gTile to the enabled list, preserving all other extension choices.
/usr/bin/python3 - <<'PY'
from gi.repository import Gio
settings = Gio.Settings.new('org.gnome.shell')
enabled = settings.get_strv('enabled-extensions')
if 'gTile@vibou' not in enabled:
    if not settings.set_strv('enabled-extensions', enabled + ['gTile@vibou']):
        raise SystemExit('Could not enable gTile in GNOME settings.')
Gio.Settings.sync()
if settings.get_boolean('disable-user-extensions'):
    print('GNOME extensions are globally disabled. Enable them in Extension Manager after logging in again.')
PY

step 'Installation complete'
printf 'GE-Proton installed: %s\nSetup log: %s\n' "$proton_tag" "$log_file"
cat <<'DONE'

Next steps:
1. Log out and back in (or reboot) to load gTile and the new app shortcuts.
2. Open ChatGPT, Claude, and TradingView and sign in.
3. Open Steam, let its first-run update finish, and sign in.
4. In a game's Properties > Compatibility, select the installed GE-Proton.
5. Open ProtonPlus to manage future GE-Proton releases. Refresh its launcher
   list after Steam has been opened for the first time.

Rerunning this script installs the latest stable GE-Proton alongside old
versions. It does not delete old versions or change your games' selections.
DONE
if [[ -f /var/run/reboot-required ]]; then
    printf '\nUbuntu requires a reboot to finish applying system updates. Reboot after setup.\n'
fi
