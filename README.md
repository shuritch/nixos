<h1 align="center">My NixOS setup</h1>

## Installation

```bash
# Working with Live CD
nix-shell -p curl git
curl https://github.com/sashapop10/nixos/disko.nix
# Edit disko.nix (replace device with name from lsblk result)
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./disko.nix
git clone https://github.com/sashapop10/nixos /mnt/flake
# Edit /mnt/flake/env.nix before running next command
sudo nixos-install --flake /mnt/flake
reboot
```

## Update / Rebuild

```bash
nix-flakes update
sudo nixos-rebuild switch --flake .#<username>@<hostname> # If Hosts updated
home-manager switch --flake .#<username>@<hostname> # If Home updated
```

<p align="center">
Copyright © 2023 <a href="https://github.com/sashapop10">sashapop10</a>.<br/>
This package is <a href="./LICENSE">MIT licensed</a>.<br/>
</p>
