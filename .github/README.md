![Atlas](./assets/2024-10-09-atlas.png "State of 2024-10-09")

<h1 align="center">
Deep dive into declarative configuration
</h1>

<!-- <div align="center">
  <a href="https://github.com/shuritch/nixos/issues">
    <img src="https://img.shields.io/github/issues/shuritch/nixos?color=dd5c89&labelColor=282828&style=for-the-badge&logo=sparkfun&logoColor=dd5c89">
  </a>
  <a href="https://github.com/shuritch/nixos/stargazers">
    <img src="https://img.shields.io/github/repo-size/shuritch/nixos?color=9c76ef&labelColor=282828&style=for-the-badge&logo=github&logoColor=9c76ef">
  </a>
  <a href="https://github.com/shuritch/nixos">
    <img src="https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=282828&logo=NixOS&logoColor=2ba1f6&color=2ba1f6">
  </a>
    <a href="https://github.com/shuritch/nixos/pulse">
    <img alt="Last commit" src="https://img.shields.io/github/last-commit/shuritch/nixos?style=for-the-badge&logo=starship&color=04B29F&logoColor=04B29F&labelColor=302D41"/>
  </a>
  <a href="https://github.com/shuritch/nixos/blob/main/.github/LICENCE">
    <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=282828&colorB=00b557&logo=unlicense&logoColor=00b557&"/>
  </a>
    <a href="https://github.com/shuritch/nixos/releases/latest">
    <img alt="Latest release" src="https://img.shields.io/github/v/release/shuritch/nixos?style=for-the-badge&logo=nixos&color=C0C9D5&logoColor=C0C9D5&labelColor=302D41" />
  </a>
</div> -->

<div align="center">
<p>

**[<kbd><br>&nbsp;Installation&nbsp;<br><br></kbd>](#installation)**
**[<kbd><br>&nbsp;Structure&nbsp;<br><br></kbd>](#structure)**
**[<kbd><br>&nbsp;Flake&nbsp;<br><br></kbd>](../flake.nix)**
**[<kbd><br>&nbsp;Assets&nbsp;and&nbsp;Preview&nbsp;<br><br></kbd>](./assets/)**
**[<kbd><br>&nbsp;Cluster&nbsp;<br><br></kbd>](../cluster/)**
**[<kbd><br>&nbsp;Modules&nbsp;<br><br></kbd>](../src/modules/)**
**[<kbd><br>&nbsp;Workflows&nbsp;<br><br></kbd>](./workflows/)**

</p>
<p align="center">
<code>📦&nbsp;Userland&nbsp;Isolation</code>
<code>🍙&nbsp;Declarative</code>
<code>🌱&nbsp;Reproducible</code>
<code>👁️‍🗨️&nbsp;Private</code>
<code>🛡️&nbsp;Secure</code>
<code>🏗️&nbsp;Custom&nbsp;Installer</code>
<code>🧪&nbsp;CI</code>
<code>🎨&nbsp;Colorscheme&nbsp;based&nbsp;on&nbsp;wallpaper</code>
<code>🔧&nbsp;Extensively&nbsp;configured</code>
<code>🐧&nbsp;Minimal&nbsp;when&nbsp;needed</code>
<code>🧳&nbsp;Role&nbsp;based&nbsp;configuration</code>
<code>🚀&nbsp;Class&nbsp;based&nbsp;configuration</code>
<code>⚡&nbsp;Easy&nbsp;to&nbsp;manage</code>
<code>🖇️&nbsp;Dualboot&nbsp;support</code>
<code>🔃&nbsp;State&nbsp;synchronization</code>
<code>🗿&nbsp;User&nbsp;specific&nbsp;configuration</code>
</p>
</div>

## Installation

> [!CAUTION]
>
> Applying custom configurations, especially those related to your operating system, can have unexpected consequences and may interfere with your system's normal behavior. While I have tested these configurations on my own setup, there is no guarantee that they will work flawlessly for you. I am not responsible for any issues that may arise from using this configuration.

```bash
# Automatic installation (Live CD)
nix-shell -p curl git
./install.sh
```

```bash
# Manual installation (Live CD)
nix-shell -p curl git
curl https://raw.githubusercontent.com/shuritch/nixos/main/core/cluster/<hostname>/disko.nix > /mnt/config/disko.nix
# Edit disko.nix (Replace device with name from lsblk result at least)
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /mnt/config/disko.nix
git clone https://github.com/shuritch/nixos /mnt/etc/nixos/flake
sudo nixos-generate-config --dir /mnt/etc/nixos
mv -f /mnt/etc/nixos/hardware-configuration.nix /mnt/etx/nixos/flake/cluster/<hostname>
sudo nixos-install --flake /mnt/etc/nixos/flake#<hostname>
# reboot 🚀
```

## Updates

```bash
nix flake update
sudo nixos-rebuild --upgrade switch --flake .#<hostname>
```

## Rebuilding

```bash
git add . # Important if new files were created
sudo nixos-rebuild switch --flake .#<hostname> # If Hosts updated
```

## Structure

```graphql
.
│  # 👇 Cluster
│ ╭> atlas                          # Desktop │ 32GB RAM, i9-9900k , RTX 2080S & UHD630 │ Hyprland
│ ├> hermes                         # Laptop  │ 16GB RAM, i7-1165G7, Iris XE G7         │ Hyprland
│ ├> pandora                        # ISO     │ Bootable USB                            │ TTY
├─┤
│ │  # 👇 Host configuration (example)
│ │ ╭> config                       # Separated configuration
│ │ ├> hardware-configuration.nix   # Generated hardware configuration.
│ └─┼> default.nix                  # Configuration entry point.
│   ╰> host_ed25519.pub             # Ssh ed25519 public key.
│
│   ╭> home                         # Modules written to isolate Home-manager configuration.
│ ┌─┼> core                         # Modules written to isolate Nixos configuration.
│ │ ├> class                        # Presets based on device class (server, desktop, etc).
│ │ ╰> roles                        # Presets based on chosen roles (headless, dev-kit, etc).
│ │  # 👆 Modules
│ │
│ ├> overlays                       # Patches and custom overrides for some packages.
│ ├> templates                      # Language based templates.
├─┼> library                        # Utilities for Nix language.
│ ├> packages                       # Self hosted packages.
│ ╰> disko                          # Disko presets.
│  # 👆 SRC
│
├> .github                          # Docs, assets, workflows
├> .vscode                          # Makes vscode more performant in this directory.
├> install.sh                       # Shell script for automatic installation.
├> shell.nix                        # Exposes a dev shell for bootstrapping.
╰> flake.nix                        # Entrypoint
```

<p align="center">
Copyright © 2022-2024 <a href="https://github.com/shuritch">Alexander Ivanov</a>.<br/>
This package is <a href="./LICENSE">MIT licensed</a>.<br/>
</p>

<h5 align="center">
<img href="https://builtwithnix.org" src="https://builtwithnix.org/badge.svg"/>
</h5>
