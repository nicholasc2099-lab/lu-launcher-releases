# LEGO Universe Launcher

The launcher for Nick's private LEGO Universe server. It sets everything up, installs the game, keeps it updated, and starts it.

## Download

Go to **[Releases → Latest](https://github.com/nicholasc2099-lab/lu-launcher-releases/releases/latest)** and pick your file under **Assets**:

| Your computer | File |
| --- | --- |
| Windows | `LEGO-Universe-Launcher-Setup-….exe` |
| Mac with Apple chip (M1 or newer, MacBook Neo) | `…-mac-arm64.dmg` |
| Mac with Intel chip (2020 and older) | `…-mac-x64.dmg` |

Not sure which Mac? Apple menu → About This Mac → "Chip" says Apple or Intel.

## Install

**Windows:** run the file. If Windows says "Windows protected your PC", click **More info**, then **Run anyway**.

**Mac (easiest, no warnings):** open **Terminal** (press ⌘ + Space, type `Terminal`, press Return), paste this line and press Return:

```
curl -fsSL https://raw.githubusercontent.com/nicholasc2099-lab/lu-launcher-releases/main/install-mac.sh | bash
```

It picks the right version for your Mac, installs it into Applications and opens it. Run the same line again any time to update the launcher.

**Mac (download instead):** open the .dmg and drag the launcher into **Applications**. Open it once; when macOS says it can't verify it, click **Done**, then go to **System Settings → Privacy & Security** and click **Open Anyway**.
If it says the app is **damaged**, open Terminal and paste:

```
xattr -cr "/Applications/LEGO Universe Launcher.app"
```

## Then

The launcher walks you through the rest: installing Tailscale (the private network the server lives on), accepting Nick's invite, downloading the game (about 4 GB), and making your game account with the play key Nick sends you.

You need an invite and a play key from Nick to play.
