{ inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./users/admin.nix
    ./bootloader.nix
    ./kdeconnect.nix
    ./tailscale.nix
    ./security.nix
    ./openssh.nix
    ./locale.nix
    ./fish.nix
    ./nix.nix
  ];
}
