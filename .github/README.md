<h1 align="center">Deep dive into declarative configuration</h1>

<h5 align="center">
  <a href="https://github.com/shuritch/nixos/issues">
    <img src="https://img.shields.io/github/issues/shuritch/nixos?color=dd5c89&labelColor=282828&style=for-the-badge&logo=sparkfun&logoColor=dd5c89">
  </a>
  <a href="https://github.com/shuritch/nixos/stargazers">
    <img src="https://img.shields.io/github/repo-size/shuritch/nixos?color=9c76ef&labelColor=282828&style=for-the-badge&logo=github&logoColor=9c76ef">
  </a>
  <a href="https://github.com/shuritch/nixos">
    <img src="https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=282828&logo=NixOS&logoColor=2ba1f6&color=2ba1f6">
  </a>
  <a href="https://github.com/shuritch/nixos/blob/main/.github/LICENCE">
    <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=282828&colorB=00b557&logo=unlicense&logoColor=00b557&"/>
  </a>
</h5>

<h5 align="center">

<details open="true">
  <summary><b>👉 Atlas</b> <i>"</i>State of 2024-08-09<i>"</i> 👈</summary><br/>

![Atlas](./assets/atlas.png "State of 2024-08-09")

</details>

<details >
  <summary><b>👉 Hermes</b> <i>"</i>State of 2024-08-22<i>"</i> 👈</summary><br/>

![Hermes](./assets/hermes.jpg "State of 2024-08-22")

</details>

</h5>

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
│  # Cluster
│ ╭> atlas                          # Desktop │ 32GB RAM, i9-9900k , RTX 2080S & UHD630 │ Hyprland
│ ├> hermes                         # Laptop  │ 16GB RAM, i7-1165G7, Iris XE G7         │ Hyprland
│ ├> pandora                        # ISO     │ Bootable USB                            │ VTY
├─┤
│ │  # Host configuration (example)
│ │ ╭> default.nix                  # Configuration entry point.
│ │ ├> hardware-configuration.nix   # Hardware configuration.
│ └─┼> environment.nix              # Host specific environment.
│   ├> disko.nix                    # Disko configuration.
│   ╰> host_ed25519.pub             # Ssh ed25519 public key.
│
│  # SRC
│ ╭> overlays                       # Patches and custom overrides for some packages.
├─┼> library                        # Utilities for Nix language.
│ ├> packages                       # Self hosted packages.
│ ├> disko                          # Disko presets.
│ │
│ │  # Modules
│ │ ╭> home                         # Modules written to isolate Home-manager configuration.
│ └─┼> core                         # Modules written to isolate Nixos configuration.
│   ├> class                        # Presets based on device class (server, desktop, etc).
│   ╰> roles                        # Presets based on chosen roles (headless, dev-kit, etc).
│
├> .github                          # Docs, assets, workflows
├> .vscode                          # Makes vscode more performant in this directory.
├> install.sh                       # Shell script for automatic installation.
├> shell.nix                        # Exposes a dev shell for bootstrapping.
╰> flake.nix                        # Entrypoint
```

<p align="center">
Copyright © 2022-2024 <a href="https://github.com/shuritch">shuritch</a>.<br/>
This package is <a href="./LICENSE">MIT licensed</a>.<br/>
</p>

<h5 align="center">
<img href="https://builtwithnix.org" src="https://builtwithnix.org/badge.svg"/>
</h5>
