#!/bin/bash
# Installs or updates the LEGO Universe Launcher on a Mac, without the "can't verify" / "damaged" warnings
# (those only apply to apps downloaded through a web browser). Run in Terminal:
#   curl -fsSL https://raw.githubusercontent.com/nicholasc2099-lab/lu-launcher-releases/main/install-mac.sh | bash
set -euo pipefail

APP="LEGO Universe Launcher"
REPO="nicholasc2099-lab/lu-launcher-releases"

# Apple chip or Intel? (hw.optional.arm64 is 1 on Apple chips, even inside Rosetta)
if [ "$(sysctl -n hw.optional.arm64 2>/dev/null || echo 0)" = "1" ]; then ARCH=arm64; else ARCH=x64; fi
echo "Finding the newest launcher for your Mac ($ARCH)..."
URL=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" | grep -o "https://[^\"]*-mac-$ARCH\.dmg" | head -1 || true)
if [ -z "$URL" ]; then echo "Couldn't find the download. Tell Nick."; exit 1; fi

TMP=$(mktemp -d)
trap 'hdiutil detach "$TMP/mnt" -quiet 2>/dev/null || true; rm -rf "$TMP"' EXIT
echo "Downloading $(basename "$URL")..."
curl -fL --progress-bar "$URL" -o "$TMP/launcher.dmg"

echo "Installing..."
hdiutil attach -nobrowse -readonly -quiet -mountpoint "$TMP/mnt" "$TMP/launcher.dmg"
DEST=/Applications
[ -w "$DEST" ] || { DEST="$HOME/Applications"; mkdir -p "$DEST"; }
osascript -e "quit app \"$APP\"" >/dev/null 2>&1 || true
rm -rf "$DEST/$APP.app"
cp -R "$TMP/mnt/$APP.app" "$DEST/"
xattr -cr "$DEST/$APP.app" 2>/dev/null || true

echo "Done. Opening the launcher (it's in $DEST)."
open "$DEST/$APP.app"
